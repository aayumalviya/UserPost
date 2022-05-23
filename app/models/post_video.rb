class PostVideo < ApplicationRecord
  belongs_to :post
  mount_uploader :video, VideoUploader
end
