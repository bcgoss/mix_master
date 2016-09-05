require 'rails_helper'

RSpec.feature "Deleting songs" do
  scenario "they delete song and end up on the same page as before" do
  #     As a user
  # Given that an artist and a song for that artist exist in the database
  artist = create(:artist_with_songs)
  song = artist.songs.first
  # When I visit the artist's song index ('/artists/1/songs')
  visit artist_songs_path(artist)
  # And I click on "Delete"
  first('li').click_link "Delete"
  # Then I should be back on whatever page I was on before (the artist's song index page)
  expect(current_path).to eq( artist_songs_path(artist) )
  # And I should not see the the song title
  expect(page).to_not have_content(song.title)
  end
end
