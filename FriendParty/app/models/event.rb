class Event < ActiveRecord::Base
  has_many :comments , as: :commentable
  belongs_to  :user
  belongs_to  :activity

  has_many :comments , as: :commentable

  mount_uploader :avatar, AvatarUploader
end
