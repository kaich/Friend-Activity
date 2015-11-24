class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.boolean :marked , :default => false

      t.timestamps null: false
    end
  end
end
