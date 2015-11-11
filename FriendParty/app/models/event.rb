class Event < ActiveRecord::Base

  acts_as_votable

  has_many :comments , as: :commentable
  belongs_to  :user
  belongs_to  :activity

  has_many :comments , as: :commentable

  mount_uploader :avatar, AvatarUploader
end
