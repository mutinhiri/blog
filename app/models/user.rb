class User < ApplicationRecord
  has_many :comments
  has_many :post
  has_many :like
end
