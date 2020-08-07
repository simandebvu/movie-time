require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'Validation Tests' do
    it 'checks for an invalid following' do
        following = Following.new(follower_id: 'hackattempt', followed_id: 'imti')
        expect(following).to_not be_valid
    end
  end

  describe 'Association Tests' do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
  end

end