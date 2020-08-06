require 'rails_helper'
RSpec.describe 'login followed by logout', type: :feature do
  feature 'Signing up' do
    scenario 'sign up user' do
      user1 = User.create(fullname: 'zack brannigan', username: "leelaissafe",email: 'zackleela@te.com', password: 'password', password_confirmation: 'password', photo: 'sdjhg', cover_image: 'hsgdjhgsd')
      user2 = User.create(fullname: 'hypnotoad', username: 'rootuser', email: 'hypnosis@te.com', password: 'password', password_confirmation: 'password', photo: 'sdjhg', cover_image: 'hsgdjhgsd')
      visit new_user_session_path
      fill_in 'user[email]', with: 'zackleela@te.com'
      fill_in 'user[password]', with: 'password'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
      click_on 'Logout'
      expect(page.current_path).to eq new_user_session_path
    end
  end
end
