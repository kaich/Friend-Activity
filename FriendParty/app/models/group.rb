class Group < ActiveRecord::Base
   validates :name , length:{maximum:50} , presence: true
   validates :intro , length:{maximum:1000}, allow_nil: true
   has_and_belongs_to_many :users

   has_many :applications
   has_many :activities
   has_one :like , as: :likeable

   def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all 
    end
  end

end
