class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.boolean :complete, null: false, default: false
      t.boolean :private, null: false, default: false

      t.timestamps
    end

    add_index :goals, :user_id
  end
end
