class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter

  mount_uploader :avatar, AvatarUploader

  has_and_belongs_to_many :groups
  has_many :comments
  has_many :originated_group , class_name: :Activity ,foreign_key: :originator_id

  has_many :participator_activities 
  has_many :participant_activities, :through => :participator_activities, :source => :activity

  has_many :favorites 

  has_many :owner_groups , class_name: "Group" , foreign_key: 'user_id'

  has_many :tracked_activities
  has_many :track_activities , :through => :tracked_activities, :source => :activity

  has_many :notifications

  def add_favorite(favoritable)
    self.favorites << favoritable 
    self.save
  end

  def remove_favorite(favoritable)
    self.favorites.delete favoritable 
    self.save
  end

  def participate?(activity)
    self.participant_activities.include? activity
  end

  def applying_group?(group)
    !Application.find_by(user_id: self.id , group_id: group.id).nil?
  end

end
