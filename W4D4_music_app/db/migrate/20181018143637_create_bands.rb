class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.integer :user_id, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :bands, :name, unique: true
  end
end
