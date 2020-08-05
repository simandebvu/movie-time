class Opinion < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: { maximum: 145 }
end
