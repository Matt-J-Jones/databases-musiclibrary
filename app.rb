# file: app.rb
require_relative 'lib/album_repository'
require_relative 'lib/database_connection'
require_relative 'lib/album'
DatabaseConnection.connect('music_library')

repository = AlbumRepository.new

# repository.print_all.each { |item|
#   puts item["title"]
# }

# puts repository.find(3)[0]["title"]
# puts repository.find(3)[0]["release_year"]

# album = Album.new("Ok, Computer", "1997", "7")
# repository.create(album)