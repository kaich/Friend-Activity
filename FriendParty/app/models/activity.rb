class Activity < ActiveRecord::Base
  validates :name , presence: true 
  validates :content , presence: true 
  validates :originator_id , presence: true 
  validates :group_id , presence: true 

  belongs_to :group
  belongs_to :originator , class_name: :User , foreign_key: :originator_id

  has_many :comments , as: :commentable

  has_many :participator_activities 
  has_many :participators, :through => :participator_activities ,:source => :user , :foreign_key => :participator_id

end
