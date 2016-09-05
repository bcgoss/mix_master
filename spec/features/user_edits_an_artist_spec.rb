require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they can edit an artist" do
    # As a user
    # Given that an artist exists in the database
    artist_name = "Bob"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    # When I visit that artist's show page
    visit artist_path(artist)
    # And I click on "Edit"
    expect(page).to have_content("Edit")
    click_link "Edit"
    # And I fill in a new name
    new_name = "Fred"
    fill_in "artist_name", with: new_name
    # And I click on "Update Artist"
    click_button "Update Artist"
    # Then I should see the artist's updated name
    expect(page).to have_content new_name
    # Then I should see the existing image
    expect(page).to have_css "img[src=\"#{artist_image_path}\"]"
  end
end
