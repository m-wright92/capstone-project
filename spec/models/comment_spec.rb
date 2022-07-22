require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    it { should have_many(:comment_reactions).dependent(:destroy) }
    it { should validate_presence_of(:comment_body) }
    it { should validate_length_of(:comment_body).is_at_least(1).is_at_most(1000) }
  end

end
