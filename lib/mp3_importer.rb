require 'pry'

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(path)
    new_files = files.select do |item|
      item.end_with? ".mp3"
    end
  end

  def import
    files.each{ |filename| Song.new_by_filename(filename)}
  end
end
