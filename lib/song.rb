require "pry"

class Song
  attr_accessor :name, :artist_name, :song_title
  attr_reader :filename
  @@all = []

  def self.create
      song = self.new
      song.save
      song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
    # binding.pry
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      if song.name == name
        song.name
      end
    end
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    self.all.sort_by do |title|
      title.name
    end
  end

  def filename
    @filename
  end

  def filename=(name)
    @filename = name
  end

  def self.new_from_filename(filename)
    f = filename.split(/[.-]/)
    f_stripped = []
    f.each {|s| f_stripped << s.strip}
    song = self.new
    song.name = f_stripped[1]
    song.artist_name = f_stripped[0]
    song
  end

  def self.create_from_filename(filename)
    f = filename.split(/[.-]/)
    f_stripped = []
    f.each {|s| f_stripped << s.strip}
    song = self.new
    song.name = f_stripped[1]
    song.artist_name = f_stripped[0]
    song.save
  end

  def self.destroy_all
    @@all = []
  end
end
