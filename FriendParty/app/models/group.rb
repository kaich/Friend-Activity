class Group < ActiveRecord::Base
   validates :name , length:{maximum:50} , presence: true
   validates :intro , length:{maximum:1000}, allow_nil: true
   has_and_belongs_to_many :users

   has_many :applications
   has_many :activities

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
