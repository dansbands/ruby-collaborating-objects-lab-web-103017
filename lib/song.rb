class Song
  attr_accessor :artist, :name

# creates instances of songs
# given each filename
  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    #initializes new song with name and artist
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

# send artists name as string to Artist class
  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end
end
