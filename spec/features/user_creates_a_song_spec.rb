require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "They see the page for the song" do
    artist = create(:artist)

    song_title = "One Love"

    visit artist_path(artist)

    click_on "New song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

  context "it validates inputs" do
    scenario "they must supply a title" do
      pending
      #     As a user
      # Given that an artist exists in the database
      artist = create(:artist)

      song_title = "One Love"

      # When I visit the individual artist page
      visit artist_path(artist)

      # And I click "New song"
      click_on "New song"
      # And I click "Create Song"
      click_on "Create Song"
      # Then I should see "Title cannot be blank" on the page
      expect(page).to have_content "Title can't be blank"
    end
  end
end
