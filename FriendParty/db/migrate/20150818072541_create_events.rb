class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :content
      t.belongs_to :activity
      t.belongs_to :user
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
