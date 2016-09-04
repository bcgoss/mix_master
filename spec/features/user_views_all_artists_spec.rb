require 'rails_helper'

RSpec.feature "User views all artists" do
  # As a user
  scenario "they see a list of all artists" do
    # Given that artists exist in the database
    artist_name = "Bob"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    # When I visit the artists index
    visit '/artists'
    # Then I should see each artist's name
    expect(page).to have_content artist_name
    click_link artist_name
    expect(current_path).to eq("/artists/#{artist.id}")
  end
end


# And each name should link to that artist's individual page
