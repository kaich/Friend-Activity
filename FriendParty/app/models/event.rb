class Event < ActiveRecord::Base
  has_many :comments , as: :commentable
  belongs_to  :user
  belongs_to  :activity
end
