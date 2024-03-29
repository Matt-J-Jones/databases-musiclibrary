require_relative 'database_connection'

class AlbumRepository
  def create(album)
    params = [album.title, album.release_year, album.artist_id]
    sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);'
    result = DatabaseConnection.exec_params(sql, params)
    
  end

  def all
    sql = 'SELECT id, title, release_year FROM albums;'
    result = DatabaseConnection.exec_params(sql, [])
    return result
  end

  def find(id)
    sql = 'SELECT title, release_year FROM albums WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
  end
end