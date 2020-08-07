require 'rails_helper'

RSpec.describe 'login user', type: :feature, js: true do
  context 'user signed in' do
    before do
      @user = User.new
      @user.fullname = 'Leela'
      @user.username = 'testuser'
      @user.password = 'leelafry'
      @user.email = 'good@mail.com'
      @user.password_confirmation = 'leelafry'
      File.open(File.expand_path('spec/bender.jpg')) do |f|
        @user.cover_image = f
        @user.photo = f
      end
      @user.save
      visit new_user_session_path
      fill_in 'Email', with: 'good@mail.com'
      fill_in 'Password', with: 'leelafry'
      click_button 'Log in'
    end

    it 'Logs in succesfully.' do
      expect(page).to have_content('Signed in successfully.')
    end

    it 'Logs out succesfully.' do
      sleep 8
      click_on 'Logout'
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'shows the correct menu links' do
      within('.navbar') do
        expect(page).to have_link('Logout')
      end
    end
  end
end
