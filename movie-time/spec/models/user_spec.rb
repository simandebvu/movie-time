require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation Tests' do
    it 'Validates presence of an email' do
      user = User.new
      user.email = ''
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'Validates a valid record' do
        user = User.new
        user.fullname = 'Leela'
        user.username = 'testuser'
        user.password = 'leelafry'
        user.email = 'good@mail.com'
        user.password_confirmation = 'leelafry'
        File.open(File.expand_path('spec/bender.jpg')) do |f|
            user.cover_image = f
            user.photo = f
        end
        expect(user.valid?).to be(true)
    end

    it 'Validates presence of a photo' do
        user = User.new
        user.fullname = 'whato'
        user.photo = nil
        user.password = 'davinci'
        user.valid?
        expect(user.errors[:photo]).to include("can't be blank")
    end
  end


  describe 'Associations' do
    it { should have_many(:followers) }
    it { should have_many(:followings) }
  end

end
