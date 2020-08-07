require 'rails_helper'

RSpec.describe 'login followed by logout', type: :feature do
  let(:username) { 'someperson' }
  let(:email) { 'teset@mail.com' }
  let(:fullname) { 'Decsiobs ashd' }
  let(:password) { 'password' }

  context 'user unsigned in' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: 'someone@mail.com'
      fill_in 'Password', with: '320103'
      click_button 'Log in'
    end

    it 'displays an error message' do
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'shows the correct menu links' do
      within('.navbar') do
        expect(page).to have_link('Sign In')
        expect(page).to have_link('Sign Up')
      end
    end
  end

  context 'user sign in' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      click_button 'Log in'
    end

    it 'shows a hello message' do
      expect(page).to have_content('Signed in successfully.')
    end

    it 'shows the correct menu links' do
      within('.user-nav') do
        expect(page).to_not have_link('Log In')
        expect(page).to_not have_link('Register')
      end

      within('.user-nav') do
        expect(page).to have_link('Movie Time')
        expect(page).to have_link('Logout')
      end
    end

    it 'create a valid post' do
      fill_in 'post_text', with: 'Hello guys it\'s me happy to be here.'
      page.execute_script("document.querySelector('form#new_post').submit()")

      expect(page).to have_content('post was created successfuly.')
    end

    it 'create a none valid post' do
      fill_in 'post_text', with: 'Hi'
      page.execute_script("document.querySelector('form#new_post').submit()")

      expect(page).to have_content('post was not created please try again.')
    end
  end
end