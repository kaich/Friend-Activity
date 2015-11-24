class Application < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  acts_as_votable
end
