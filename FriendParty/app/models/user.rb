class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :groups
  has_many :applications
  has_many :comments
  has_many :originated_group , class_name: :Activity ,foreign_key: :originator_id

  has_many :participator_activities 
  has_many :participant_activities, :through => :participator_activities, :source => :activity

  has_many :likes 

  has_many :owner_groups , class_name: "Group" , foreign_key: 'user_id'


  def like(likeable)
    self.likes << likeable 
    self.save
  end

  def unlike(likeable)
    self.likes.delete likeable 
    self.save
  end

end
