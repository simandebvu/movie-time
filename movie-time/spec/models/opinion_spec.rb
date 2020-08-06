require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'Validation Tests' do
    let(:test_user) { User.new(fullname: 'Fry Frozen', username: 'testuser', password: 'simplepassword', password_confirmation: 'simplepassword', photo:'sdjdshg', cover_image: 'jhdsgdghjh') }
    it 'Validates presence of text per opinion' do
      op = Opinion.new
      op.text = "Bender is great!"
      op.user = test_user
      expect(op).to be_valid
    end

    it 'Identifies an incorrect record' do
        op = Opinion.new
        expect(op).to_not be_valid
    end
  end


  describe 'Associations' do
    it { should belong_to(:user) }
  end

end
