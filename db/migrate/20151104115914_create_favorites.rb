class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :user
      t.references :favoritable, polymorphic: true 

      t.timestamps
    end

    add_index :favorites, [:favoritable_id, :favoritable_type], unique: true
  end
end
