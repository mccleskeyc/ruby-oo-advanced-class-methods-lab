class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    search = self.all.detect{|song| song.name == title}
    search
  end

  def self.find_or_create_by_name(title)
    search = self.find_by_name(title)
    if search
      search
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    alphabatized = self.all.sort_by {|song| song.name}
    alphabatized
  end

  def self.new_from_filename(file)
    parts = file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    parts = file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
