class CommentReaction < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  validates :reaction_type, presence: true, inclusion: { in: %w[like dislike] }
end
