class Post < ApplicationRecord
  
  belongs_to :user
  has_many :post_images, dependent: :destroy
  has_many :like_posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_videos, dependent: :destroy
end
