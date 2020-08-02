class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :opinions, dependent: :destroy
    has_many :followings, foreign_key: :follower_id
    has_many :followers, class_name: :Following, foreign_key: :followed_id
end
