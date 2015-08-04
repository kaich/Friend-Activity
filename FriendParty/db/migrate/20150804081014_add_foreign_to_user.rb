class AddForeignToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :group, index: true, foreign_key: true
    end 

    add_index :users, [:group_id, :created_at]
  end
end
