class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :year
      t.string :genre
      t.text :lyric

      t.timestamps
    end
  end
end
