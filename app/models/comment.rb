class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_reactions, dependent: :destroy
  validates :comment_body , presence: true, length: { minimum: 1, maximum: 1000 }
end
