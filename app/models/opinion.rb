class Opinion < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: { maximum: 145 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  
end
