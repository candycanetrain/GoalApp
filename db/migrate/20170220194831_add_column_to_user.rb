class AddColumnToUser < ActiveRecord::Migration[5.0]

  def change
    add_column :users, :username, :string
    add_column :users, :session_token, :string
    add_column :users, :password_digest, :string
  end

  add_index :users, :username, unique: true
  add_index :users, :session_token, unique: true

end
