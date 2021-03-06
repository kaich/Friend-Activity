class AddInformationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :real_name, :string
    add_column :users, :signature, :string
    add_column :users, :job, :string
    add_column :users, :qq_number, :integer
    add_column :users, :current_address, :string
    add_column :users, :home_address, :string
    add_column :users, :intr, :text
    add_column :users, :age, :date
  end
end
