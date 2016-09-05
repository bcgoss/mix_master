class Song < ActiveRecord::Base
  belongs_to :artist
  validates :title, presence:true, uniqueness:true
end
