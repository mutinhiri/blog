require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create(name: 'first', password: '123456', bio: 'I am the first user',
                           email: 'first@first.com', confirmed_at: Time.now)
      @user2 = User.create(name: 'second', password: '123456', bio: 'I am the second user',
                           email: 'second@second.com', confirmed_at: Time.now)
      visit root_path
      fill_in placeholder: 'User Email', with: 'first@first.com'
      fill_in placeholder: 'User Password', with: '123456'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username of all users' do
      expect(page).to have_content('first')
      expect(page).to have_content('second')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts : 0')
    end

    it 'show users page when clicked' do
      expect(page).to have_content('Number of posts : 0')
      click_on 'first'
      expect(page).to have_current_path user_path(@user1)
      expect(page).to have_no_content('second')
    end
  end
end
