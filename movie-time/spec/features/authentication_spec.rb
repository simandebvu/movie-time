require 'rails_helper'
RSpec.describe 'login followed by logout', type: :feature do
  feature 'Signing up' do
    before(:each) do
        @user = User.new
        @user.fullname = 'Leela'
        @user.username = 'testuser'
        @user.password = 'leelafry'
        @user.email = 'good@mail.com'
        @user.password_confirmation = 'leelafry'
        File.open(File.expand_path('spec/bender.jpg')) do |f|
            user.cover_image = f
            user.photo = f
        end
        @user.save
        @user2 = User.new
        @user2.fullname = 'Leela2'
        @user2.username = 'testuser2'
        @user2.password = 'leelafry2'
        @user2.email = 'good@mail.com2'
        @user2.password_confirmation = 'leelafry2'
        File.open(File.expand_path('spec/bender.jpg')) do |f|
            user.cover_image = f
            user.photo = f
        end
        @user2.save
        visit new_user_session_path
        fill_in 'user_email', with: 'zackleela@te.com'
        fill_in 'user_password', with: 'password'
        click_button 'Log in'
    end

    scenario 'sign in' do
      expect(page).to have_content('Lets opinionate!')
      click_on 'Logout'
      expect(page.current_path).to eq new_user_session_path
    end
  end
end
