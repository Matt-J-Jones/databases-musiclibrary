# file: app.rb
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

require_relative 'lib/database_connection'
require_relative 'lib/album'

class Application

  def initialize(database_name, io = Kernel, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts "Welcome to the music library manager!"
    @io.puts "What would you like to do?"
    @io.puts "1 - List all albums"
    @io.puts "2 - List all artists"

    choice = @io.gets.chomp

    if choice == '1'
      albums = @album_repository.all
      albums.each do |album|
        @io.puts "* #{album['id']} - #{album['title']}"
      end
    elsif choice == '2'
      artist = @artist_repository.all
      artist.each do |row|
        @io.puts "* #{row['id']} - #{row['name']}"
      end
    end
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end