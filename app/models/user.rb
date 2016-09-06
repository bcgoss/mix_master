class User < ActiveRecord::Base
  def self.find_or_create_from_auth(auth)
    User.find_or_create_by(
      provider: auth["provider"],
      uid: auth["info"]["id"],
      name: auth["info"]["display_name"]
    )
  end
end
