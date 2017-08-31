class Blog < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	belongs_to :user,  optional: true
	has_many :comments, as: :commentable
end
