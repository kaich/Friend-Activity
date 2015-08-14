class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :groups
  has_many :applications
  has_many :originated_group , class_name: :Activity ,foreign_key: :originator_id

  has_many :participator_activities 
  has_many :participant_activities, :through => :participator_activities, :source => :activity
end
