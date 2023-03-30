require_relative '../app.rb'
require_relative '../lib/database_connection'

RSpec.describe Application do
  it "takes input and returns" do
    io = double :io
    albums = AlbumRepository.new
    artists = ArtistRepository.new
    DatabaseConnection.connect('music_library_test')
    app = Application.new('music_library_test', io, albums, artists)
    
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with("1 - List all albums")
    expect(io).to receive(:puts).with("2 - List all artists")
    expect(io).to receive(:puts).with("Enter your choice:")
    expect(io).to receive(:gets).and_return("1")

    expect(io).to receive(:puts).with("Here is the list of albums:")
    expect(io).to receive(:puts).with("* 1 - Doolittle")
    expect(io).to receive(:puts).with("* 2 - Surfer Rosa")
    expect(io).to receive(:puts).with("* 3 - Waterloo")
    expect(io).to receive(:puts).with("* 4 - Super Trouper")
    expect(io).to receive(:puts).with("* 5 - Bossanova")
    expect(io).to receive(:puts).with("* 6 - Lover")
    expect(io).to receive(:puts).with("* 7 - Folklore")
    expect(io).to receive(:puts).with("* 8 - I Put a Spell on You")
    expect(io).to receive(:puts).with("* 9 - Baltimore")
    expect(io).to receive(:puts).with("* 10 -	Here Comes the Sun")
    expect(io).to receive(:puts).with("* 11 - Fodder on My Wings")
    expect(io).to receive(:puts).with("* 12 -	Ring Ring")
  end
end