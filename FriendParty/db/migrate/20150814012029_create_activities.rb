class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :content
      t.datetime :start_time
      t.datetime :end_time
      t.integer :originator_id
      t.integer :status
      t.integer :group_id
      
      t.timestamps
    end
  end
end
