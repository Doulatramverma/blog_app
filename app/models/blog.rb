class Blog < ApplicationRecord
	belongs_to :user,  optional: true
	has_many :comments, as: :commentable
	has_many :taggings  ,dependent: :destroy
end
