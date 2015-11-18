class CreateTrackedActivities < ActiveRecord::Migration
  def change
    create_table :tracked_activities do |t|
      t.integer :user_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
