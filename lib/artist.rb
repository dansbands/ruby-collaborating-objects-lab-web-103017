

class Artist
  # keeps track of all instances of artist
  @@all = []

  # lets us call Artist.song or instance.song
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    # artist instance keeps track of its songs
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(new_song)
    @songs << new_song
  end

  def self.find_or_create_by_name(artist_name)
     if self.all.find{|artist| artist.name == artist_name}
       self.all.find{|artist| artist.name == artist_name}
     else
      instance = self.new(artist_name).tap {|artist| artist.save }
    end
  end

  def save
    @@all << self
  end

  def print_songs
    self.songs.collect do |song|
      puts song.name
    end
  end
end
