class Blog < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user,  optional: true
	has_many :comments, as: :commentable
	has_many :taggings  ,dependent: :destroy
end
