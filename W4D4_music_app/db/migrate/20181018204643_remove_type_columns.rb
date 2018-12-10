class RemoveTypeColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :type
    remove_column :tracks, :type

    add_column :albums, :recording_style, :string
    add_column :tracks, :track_type, :string
  end
end
