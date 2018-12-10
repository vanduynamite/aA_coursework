class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.timestamps
    end
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.integer :sub_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :moderator, null: false
      t.timestamps
    end
  end
end
