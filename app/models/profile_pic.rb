class ProfilePic < ActiveRecord::Base
	validates :avatar, presence: true
	belongs_to :user
	mount_uploader :avatar, AvatarUploader
end
