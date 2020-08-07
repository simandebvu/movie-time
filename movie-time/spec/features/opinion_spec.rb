require 'rails_helper'

RSpec.feature 'Create Opinion', type: :feature do
  before :each do
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

    opinion = @user.opinions.build(text: 'Bender should be in avengers !')
    opinion.save
    visit new_user_session_path
    fill_in 'Email', with: 'good@mail.com'
    fill_in 'Password', with: 'leelafry'
    click_button 'Log in'
  end

  scenario 'Opinion creation', type: :feature do
    expect(page.current_path).to eq root_path
    page.fill_in 'opinion[text]', with: 'Create Opinion is not as great as bender'
    click_button 'Create Opinion'
    expect(page).to have_text 'Create Opinion is not as great as bender'
  end
end