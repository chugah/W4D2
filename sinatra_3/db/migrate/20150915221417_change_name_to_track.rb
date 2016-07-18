class ChangeNameToTrack < ActiveRecord::Migration
  def change
    rename_column :reviews, :song_id, :track_id
  end
end
