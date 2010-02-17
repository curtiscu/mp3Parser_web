class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :artist
      t.string :album
      t.string :title
      t.integer :track
      t.string :genre
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
