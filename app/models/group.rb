class Group < ActiveRecord::Base
   validates :name , length:{maximum:50} , presence: true
   validates :intro , length:{maximum:1000}, allow_nil: true
   has_and_belongs_to_many :users

   has_many :applications
   has_many :activities
   has_one :favorite , as: :favoritable
   belongs_to :owner , class_name: "User", foreign_key: "user_id"

   mount_uploader :avatar, AvatarUploader

   def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all 
    end
  end

end
