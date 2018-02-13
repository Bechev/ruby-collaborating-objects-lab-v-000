class Artist

  attr_accessor :name
  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(new_song)
    @songs << new_song
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end


  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def save
    @@all << self
  end


  def songs
    @songs
  end


  def print_songs
    @songs.each do |song|
      puts "#{song.name}"
    end
  end
end
