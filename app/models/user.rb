class User < ApplicationRecord
  before_destroy :destroy_relations
  mount_uploader :photo, PhotoUploader
  mount_uploader :cover_image, CoverImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :opinions, dependent: :destroy
  has_many :followings, foreign_key: :follower_id
  has_many :followers, class_name: :Following, foreign_key: :followed_id
  scope :all_except, ->(user) { where.not(id: user) }

  validates :username, presence: true, length: { maximum: 20 }
  validates :fullname, presence: true, length: { maximum: 20 }
  validates :photo, presence: true
  validates_integrity_of :photo
  validates_processing_of :photo
  validates :cover_image, presence: true
  validates_integrity_of :cover_image
  validates_processing_of :cover_image

  def own_opinions(usr)
    Opinion.where(user_id: usr)
  end

  def follows?(usr)
    followings.where({ followed_id: usr.id }).exists?
  end

  def follow(usr)
    followings.create({ followed_id: usr.id }) unless follows?(usr)
  end

  def unfollow(usr)
    followings.where({ followed_id: usr.id }).destroy_all
  end

  def friends_and_own_opinions(usr)
    Opinion.where('user_id in (?)', (
      usr.followers_ids + usr.followings_ids + [usr.id]
    ).uniq)
      .includes(:user)
      .order(created_at: :desc)
  end

  def all_opinions(usr)
    ids = usr.followings.pluck(:followed_id) << usr.id
    Opinion.where(user_id: ids).order({ created_at: :desc })
  end

  def all_suggestions(usr)
    User.where('id NOT IN (?)', usr.followings.map(&:followed_id) + [usr.id])
      .limit(5)
      .order(created_at: :desc)
  end

  def destroy_relations
    followers.destroy_all
    followings.destroy_all
    opinions.destroy_all
  end
end
