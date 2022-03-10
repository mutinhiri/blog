require 'rails_helper'

RSpec.describe 'Login', type: :feature do
    describe 'User' do
        before(:each) do
            @user1= User.create(name: 'first', password: '12345', bio: 'first user test', email: 'first@first.com', confirmed_at: Time.now)
            visit root_path