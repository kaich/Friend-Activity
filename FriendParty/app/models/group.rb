class Group < ActiveRecord::Base
   validates :name , length:{maximum:50} , presence: true
   validates :intro , length:{maximum:200}, allow_nil: true
   has_many :users
end
