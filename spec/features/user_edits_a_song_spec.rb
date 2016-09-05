require 'rails_helper'

RSpec.feature "Users can edit an existing song" do
  scenario "they edit a song's title" do
    #as a User
    #given that a song exists
    artist = create(:artist)
    song_title = "One Love"
    song = artist.songs.create(title: song_title)
    new_title = "Two love"

    #when I visit the song's page
    visit song_path(song)

    #and I click "edit"
    click_link "Edit"

    #and I fill in a new title
    fill_in "song_title", with: new_title

    #and I click "Update Song"
    click_button "Update Song"

    #then I should see the songs new title
    expect(page).to have_content new_title

    #and I should see a link to the song's artists
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
