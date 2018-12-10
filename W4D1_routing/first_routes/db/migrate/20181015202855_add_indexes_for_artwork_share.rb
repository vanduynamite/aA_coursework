class AddIndexesForArtworkShare < ActiveRecord::Migration[5.2]
  def change

    add_index :artwork_shares, [:artwork_id, :viewer_id]

    # The index makes a secondary sort based on the field indexed.
    # This makes it much faster to search based on that field.
    # Add an index to fields that you will likely look up a lot.
    # For instance, in this case it is likely we will try to find
    ## users by username.
    add_index :users, :username

  end
end
