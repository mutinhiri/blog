class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :likes

  def recent_5_comments
    comment.order('created_at Desc').limit(5)
  end

  after_save :update_posts_counter

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
