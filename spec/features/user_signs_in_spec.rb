require 'rails_helper'

RSpec.feature "User signs in with Spotify" do
  scenario "they see a link to sign out" do
    # As a user
    auth_data = {'provider' => 'spotify', 'info' => {
      'display_name' => 'Fake User', 'id' => '12345'
      }
    }

    OmniAuth.config.mock_auth[:spotify] = auth_data

    # When I visit the playlists index
    visit playlists_path

    # And I click "Sign in with Spotify"
    click_link "Sign in with Spotify"
    # Then I should see a "Sign Out" link
    expect(page).to have_content("Sign out")
    # And I should see my display name
    expect(page).to have_content(auth_data['info']['display_name'])
    # And I should not see "Sign in with Spotify"
    expect(page).to_not have_content("Sign in with Spotify")
  end
end
