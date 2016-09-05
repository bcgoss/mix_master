FactoryGirl.define do
  factory :artist do
    name { generate(:name)}
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

  sequence :name do |n|
    "Artist Name #{n}"
  end

  sequence :title do |n|
    "Song Title #{n}"
  end
end
