class User < ApplicationRecord
  has_many :comments
  has_many :post
  has_many :like

  def recent_posts
    Post.last(3)
  end
end
