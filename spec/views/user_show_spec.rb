require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create(name: 'first', password: '123456',
                           bio: 'I am the first user',
                           email: 'first@first.com', confirmed_at: Time.now)

      visit root_path
      fill_in placeholder: 'User Email', with: 'first@first.com'
      fill_in placeholder: 'User Password', with: '123456'
      click_button 'Log in'

      @post1 = Post.create(title: 'First Post',
                           text: 'This is the first post',
                           comments_counter: 0, likes_counter: 0, user: @user1)
      @post2 = Post.create(title: 'Second Post',
                           text: 'This is the second post',
                           comments_counter: 0,
                           likes_counter: 0, user: @user1)
      @post3 = Post.create(title: 'Third Post',
                           text: 'This is the third post',
                           comments_counter: 0,
                           likes_counter: 0, user: @user1)

      visit user_path(@user1.id)
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the username' do
      expect(page).to have_content('first')
    end

    it 'shows number of posts for each user' do
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end

    it 'shows the users bio' do
      expect(page).to have_content('I am the first user')
      visit user_session_path
    end

    it "Should see the user's first 3 posts" do
      expect(page).to have_content 'This is the first post'
      expect(page).to have_content 'This is the second post'
      expect(page).to have_content 'This is the third post'
    end

    it 'see all post button exists' do
      expect(page).to have_content('See all posts')
    end

    it 'redirects to posts index page after clicking on see all posts' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end