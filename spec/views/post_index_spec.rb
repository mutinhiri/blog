require 'rails_helper'

RSpec.describe 'Login', type: :feature do
    describe 'User' do
        before(:each) do
            @user1= User.create(name: 'first', password: '12345', bio: 'first user test', email: 'first@first.com', confirmed_at: Time.now)
            visit root_path
            fill_in placeholder: 'User Email', with: 'first@first.com'
            fill_in placeholder: 'User Password', with '12345'
            click_button 'Log in'

            @post1 = Post.create(title: 'First Post', text: 'This is the first post', comments_counter: 0, likes_counter: 0, user: @user1)
            @post2 = Post.create(title: 'Second Post', text: 'Thus is the second post' comments_counter: 0, likes_counter: 0, user: @user1)
            @post3 = Post.create(title: 'Third Post', text: 'This is the third post', comments_counter:0, likes_counter: 0, user: @user1)

            @comment1 = Comment.create(text: 'This is first comment for the first post', user: User.first, post: Post.first)
            @comment2 = Comment.create(text: 'This is the second comment', user: User.first, post: Post.first)
            @comment3 = Comment.create(text: 'This is the third comment',user: User.first, post: Post.first )

            visit user_posts_path(@user1)
        end
        
        it 'shows user photo' do
            image = page.all('img')
            expect(image.size).to eql(1)
        end

        it 'shows username' do
          expect(page).to have_content('first')
        end

        it 'Checks proper post length' do
          post = Post.all
          expect(post.size).to eql(3)
        end

        it 'shows number of posts by user' do
          user = User.First
          expect(page).to have_content(user.posts_counter)
        end

        it 'shows post title' do
          expect(page).to have_content('Second Post')
          visit user_session_path
        end

        it 'can see some of the posts body' do
          expect(page).to have_content 'This is first comment for the first post'
        end

        it 'can see how many likes the post has' do
          post= Post.first
          expect(page).to have_content(post.likes_counter)
        end
        