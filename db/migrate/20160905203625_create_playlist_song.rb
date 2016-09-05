class CreatePlaylistSong < ActiveRecord::Migration
  def change
    create_table :playlist_songs do |t|
      t.references :song, index: true, foreign_key: true
      t.references :playlist, index: true, foreign_key: true
    end
  end
end
