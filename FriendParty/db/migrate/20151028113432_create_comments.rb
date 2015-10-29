class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.text   :content
      t.string :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
