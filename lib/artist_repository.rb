require 'database_connection'

class ArtistRepository
  def initialize
    #
  end

  def create(artist)
    params = [artist.name, artist.genre]
    sql = 'INSERT INTO artists (name, genre) VALUES ($1, $2);'
    result = DatabaseConnection.exec_params(sql, params)
  end

  def all
    sql = 'SELECT id, name, genre FROM artists;'
    result = DatabaseConnection.exec_params(sql, [])
    return result
  end

  def find(id)
    sql = 'SELECT name, genre FROM artists WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
  end

  def find_with_albums(id)
    sql = 'SELECT artists.id,
                  artists.name,
                  artists.genre,
                  albums.id AS album_id,
                  albums.title,
                  albums.release_year
          FROM artists
          JOIN albums ON albums.artist_id = artists.id
          WHERE artists.id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    artist = Artist.new

    artist.id = result.first['id']
    artist.name = result.first['name']
    artist.genre = result.first['genre']

    result.each do |record|
      album = Album.new
      album.id = record['album_id']
      album.title = record['title']
      album.release_year = record['release_year']

      artist.albums << album
    end

    return artist
  end
end