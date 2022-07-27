class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_reactions, dependent: :destroy
  validates :post_body, presence: true, length: { minimum: 1, maximum: 1000 }

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :most_recent_ten, -> { ordered_by_most_recent.limit(10) }
end
