require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :friendships }
  it { should have_many :friends }
  it { should have_many :posts }
  it { should have_many :comments }
  it { should have_many :post_reactions }
  it { should have_many :comment_reactions }
end
