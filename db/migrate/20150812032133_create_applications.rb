class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.text :content
      t.integer :user_id
      t.integer :group_id
      t.integer :status  ,default: 0

      t.timestamps
    end

    add_index :applications , :group_id  
    add_index :applications , :user_id  
    add_index :applications , [:user_id,:group_id] , unique: true  
  end
end
