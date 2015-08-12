class Application < ActiveRecord::Base
  belongs_to :applicationable, :polymorphic => true  
end
