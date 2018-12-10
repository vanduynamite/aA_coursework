class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.timestamps
    end
    add_index :users, :username, unique: true

    create_table :sessions do |t|
      t.integer :user_id, null: false
      t.string :session_token, null: false
      t.timestamps
    end
    add_index :sessions, :user_id
    add_index :sessions, :session_token, unique: true
  end
end
