require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      User.create(name: 'first', password: '123456', bio: 'I am the first user', email: 'first@first.com',
                  confirmed_at: Time.now)
    end
    it 'shows the right content' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      fill_in placeholder: 'User Email', with: 'first@gmail.com'
      fill_in placeholder: 'User Password', with: '12356'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Without fill email and password inputs' do
      visit new_user_session_path
      fill_in placeholder: 'User Email', with: ''
      fill_in placeholder: 'User Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      fill_in placeholder: 'User Email', with: 'first@first.com'
      fill_in placeholder: 'User Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_current_path root_path
    end
  end
end