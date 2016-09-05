require 'rails_helper'

RSpec.feature "Song Index" do
  scenario "they visit '/songs'" do
    # As a user
    # Given that songs exist in the database
    artist = create(:artist_with_songs)
    first_song = artist.songs.first
    # When I visit the songs index ('/songs')
    visit '/songs'
    # Then I should see the titles of all songs in the database sorted alphabetically
    expect(page).to have_content first_song.title
    # And the titles should each link the individual song page
    click_link first_song.title
    expect(current_path).to eq("/songs/#{first_song.id}")
  end
end
