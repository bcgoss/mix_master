FactoryGirl.define do
  factory :artist do
    name { generate(:artist_name)}
    image_path "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    factory :artist_with_songs do
      transient do
        song_count 5
      end

      after(:create) do |artist, evaluator|
        create_list(:song, evaluator.song_count, artist: artist)
      end
    end
  end

  factory :song do
    artist
    title { generate(:title) }
  end

  factory :playlist do
    name { generate(:playlist_name) }

    factory :playlist_with_songs do
      transient do
        song_count 5
      end

      after(:create) do |playlist, evaluator|
        create_list(:song, evaluator.song_count, playlists: [playlist])
      end
    end
  end

  sequence :artist_name do |n|
    "Artist Name #{n}"
  end

  sequence :title do |n|
    "Song Title #{n}"
  end

  sequence :playlist_name do |n|
    "Playlist #{n}"
  end
end
