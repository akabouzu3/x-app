class AddColumsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :username, :string
    add_column :users, :remember_digest, :string
    add_column :users, :admin, :boolean, default: false
    add_index :users, :email, unique:true
    add_index :users, :username, unique: true
  end
end
