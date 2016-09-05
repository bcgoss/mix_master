require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see all the playlists as links" do

    # As a user
    # Given that playlists exist in the database
    playlist = create(:playlist)
    # When I visit the playlists index
    visit playlists_path
    # Then I should see each playlist's name
    expect(page).to have_content playlist.name
    # And each name should link to that playlist's individual page
    expect(page).to have_link playlist.name, href: playlist_path(playlist)
  end
end
