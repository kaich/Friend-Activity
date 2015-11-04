class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.references :likeable, polymorphic: true 

      t.timestamps
    end

    add_index :likes, [:likeable_id, :likeable_type], unique: true
  end
end
