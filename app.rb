# file: app.rb
require_relative 'lib/album_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect('music_library')

repository = AlbumRepository.new

repository.print_all.each { |item|
  puts item["title"]
}