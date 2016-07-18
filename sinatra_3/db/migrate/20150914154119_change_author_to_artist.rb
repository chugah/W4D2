class ChangeAuthorToArtist < ActiveRecord::Migration
  def change
    rename_column :tracks, :author, :artist
  end
end
