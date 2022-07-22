require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:post_reactions).dependent(:destroy) }
    it { should validate_presence_of(:post_body) } 
    it { should validate_length_of(:post_body).is_at_least(1).is_at_most(1000) }
  end
end
