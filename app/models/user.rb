class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :like_posts, dependent: :destroy 
  has_many :post_comments, dependent: :destroy
  mount_uploader :profile, ProfileUploader 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
        user = User.new(email: data['email'],
           password: Devise.friendly_token[0,20]
        )
        user.remote_profile_url = data['image']
        user.save
    end
    user
  end
end
