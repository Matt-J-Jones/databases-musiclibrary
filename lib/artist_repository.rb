require_relative 'database_connection'

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
end