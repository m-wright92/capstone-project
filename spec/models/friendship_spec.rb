require 'rails_helper'

describe Friendship do
  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :friend }
  end
end