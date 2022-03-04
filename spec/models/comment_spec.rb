require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.create(name: 'Bunbee', photo: 'https://genericphoto.com/user1', bio: 'Software developer from Taiwan')
    post1 = Post.new(user: user1, title: 'post', text: 'This is my testing post')
    com1 = Comment.new(user: user1, post: post1, text: 'Comment1')
    com1.update_comments_counter

    it 'comments counter works' do
      current = post1.comments_counter
      com2 = Comment.new(user: user1, post: post1, text: 'Comment2')
      com2.update_comments_counter
      expect(post1.comments_counter).to eq(current + 1)
    end
  end
end