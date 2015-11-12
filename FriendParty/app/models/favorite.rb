class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favoritable , :polymorphic => true 

  validates :user_id, uniqueness: { 
    scope: [:favoritable_id, :favoritable_type],
    message: 'can only add favorite an item once'
  }


  def favorite_by_user?(user)
    self.user_id == user.id
  end

end
