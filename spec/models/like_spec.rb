require 'rails_helper'

require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.create(id: 1, name: 'Bunbee', photo: 'https://genericphoto.com/user1', bio: 'Software developer from Taiwan')
    @post = Post.create(user: @user, title: 'Post 1 title', text: 'this is a post?',likes_counter: 5)
    @like = Like.new(user_id: @user.id, post_id: @user.id)
  end

  describe 'validation tests' do
    it 'validates the user_id' do
      expect(@like.user_id).to eq(1)
    end

    it 'validates the post_id' do
      expect(@like.post_id).to eq(1)
    end
  end

  describe 'like model methods tests' do
    it 'should increment the post likes_counter' do
      @like.save
      expect(@post.likes_counter).to eq(5)
    end
  end
end