json.extract! song, :id, :title, :artist, :year, :genre, :lyric, :created_at, :updated_at
json.url song_url(song, format: :json)
