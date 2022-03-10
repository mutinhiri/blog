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
            @post