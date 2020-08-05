class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :opinions, dependent: :destroy
  has_many :followings, foreign_key: :follower_id
  has_many :followers, class_name: :Following, foreign_key: :followed_id
  scope :all_except, ->(user) { where.not(id: user) }

    def own_opinions(usr)
      Opinion.where(user_id: usr)
    end

    def follows?(usr)
      followings.where( { followed_id: usr.id} ).exists?
    end

    def follow(usr)
      followings.create({ followed_id: usr.id}) unless follows?(usr)
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
end