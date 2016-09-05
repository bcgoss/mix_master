require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they try to delete an artist" do
    # As a user
    # Given that an artist exists in the database
    artist_name = "Bob"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    # When I visit that artist's show page
    visit artist_path(artist)
    # And I click on "Delete"
    click_link "Delete"
    # Then I should be back on the artist index page
    expect(current_path).to eq(artists_path)
    # Then I should not see the artist's name
    expect(page).to_not have_content("Bob")
  end

end
