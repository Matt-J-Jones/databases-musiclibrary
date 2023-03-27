class Album
  def initialize(title, year)
    @title = title
    @year = year
  end

  def album_title
    return @title
  end

  def year_of_release
    return @year
  end
end