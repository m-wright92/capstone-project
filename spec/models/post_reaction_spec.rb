require 'rails_helper'

RSpec.describe PostReaction, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it { should validate_presence_of(:reaction_type) }
  it { should validate_inclusion_of(:reaction_type).in_array(%w[like dislike]) }
end
