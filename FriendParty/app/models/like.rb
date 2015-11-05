class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable , :polymorphic => true 

  validates :user_id, uniqueness: { 
    scope: [:likeable_id, :likeable_type],
    message: 'can only like an item once'
  }


  def liked_by_user?(user)
    self.user_id == user.id
  end

end
