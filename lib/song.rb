require "pry"

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :songs, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    binding.pry
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)     
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? nil : genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)

  end

  def genres
    self.all.collect {|song| song.genre} 
  end

  def artists
    
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
end