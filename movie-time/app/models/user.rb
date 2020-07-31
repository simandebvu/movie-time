class User < ApplicationRecord
    has_many :opinions, dependent: :destroy
    has_many :followings, foreign_key: :follower_id
    has_many :followers, class_name: :Following, foreign_key: :followed_id
end
