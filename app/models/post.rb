class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_reactions, dependent: :destroy
  validates :post_body, presence: true, length: { minimum: 1, maximum: 1000 }
end
