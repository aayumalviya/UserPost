class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :like_posts, dependent: :destroy 
  has_many :post_comments, dependent: :destroy
  mount_uploader :profile, ProfileUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
