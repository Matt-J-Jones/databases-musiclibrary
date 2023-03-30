class Album
  def initialize(id, title, year, artist_id)
    @id = id
    @title = title
    @year = year
    @artist_id = artist_id
  end

  def album_title
    return @title
  end

  def year_of_release
    return @year
  end

  def artist_id
    return @artist_id
  end

  def id
    return @id
  end
end