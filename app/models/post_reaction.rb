class PostReaction < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :reaction_type, presence: true, inclusion: { in: %w[like dislike] }
end
