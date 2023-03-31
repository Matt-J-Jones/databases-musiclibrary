require 'database_connection'
require 'artist_repository'


RSpec.describe ArtistRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test'})
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it 'finds artist 1 with related albums' do
    repository = ArtistRepository.new
    artist = repository.find_with_albums(1)

    expect(artist.name).to eq('Pixies')
    expect(artist.albums.length).to eq(3)
  end
end
