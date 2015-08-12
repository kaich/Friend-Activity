class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.text :content
      t.integer :user_id
      t.integer :status
      t.references :applicationable , :polymorphic => true  

      t.timestamps
    end
  end
end
