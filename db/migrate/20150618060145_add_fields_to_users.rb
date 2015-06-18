class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, default: ""
    add_index :users, :username, unique: true
    add_column :users, :admin, :boolean, default: false
  end
end
