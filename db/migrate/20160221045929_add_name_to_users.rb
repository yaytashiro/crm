class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ToUsers, :string
    add_column :users, :family_name, :string
    add_column :users, :given_name, :string
  end
end
