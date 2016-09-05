require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see the changes they made" do
    #     As a user
    # Given that a playlist and songs exist in the database
    playlist = create(:playlist_with_songs)
    new_name = "Test"
    song_to_add = create(:song)
    song_to_remove = playlist.songs.first
    # When I visit that playlist's show page
    visit playlist_path(playlist)
    # And I click on "Edit"
    click_on "Edit"
    # And I enter a new playlist name
    fill_in "playlist_name", with: new_name
    # And I select an additional song
    check("song-#{song_to_add.id}")
    # And I uncheck an existing song
    uncheck("song-#{song_to_remove.id}")
    # And I click on "Update Playlist"
    click_button "Update Playlist"
    # Then I should see the playlist's updated name
    expect(page).to have_content new_name
    # And I should see the name of the newly added song
    expect(page).to have_content song_to_add.title
    # And I should not see the name of the removed song
    expect(page).to_not have_content song_to_remove
  end
end
