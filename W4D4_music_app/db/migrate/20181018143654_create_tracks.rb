class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.integer :user_id, null: false
      t.string :name, null: false
      t.integer :ord, null: false
      t.string :type
      t.text :lyrics

      t.timestamps
    end

    add_index :tracks, :album_id
    add_index :tracks, :user_id
    add_index :tracks, [:album_id, :name], unique: true
  end
end
