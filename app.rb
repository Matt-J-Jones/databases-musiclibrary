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
    @io.puts "Enter your choice:"
    @io.puts "1 - List all albums"
    @io.puts "2 - List all artists"

    choice = @io.gets.chomp

    if choice == '1'
      @io.puts "Here is the list of albums:"
      albums = @album_repository.all
      albums.each do |album|
        @io.puts "* #{album['id']} - #{album['title']}"
      end
    elsif choice == '2'
      @io.puts "Here is the list of artists:"
      artists = @artist_repository.all
      artists.each do |artist|
        @io.puts "* #{artist['id']} - #{artist['name']}"
      end
    end
  end
end

if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end