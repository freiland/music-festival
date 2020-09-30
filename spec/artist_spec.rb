require ('rspec')
require ('artist')
require('stage')
require('pry')

describe '#Artist' do 

  before (:each) do 
    Stage.clear()
    Artist.clear()
    @stage =  Stage.new("SRV Stage", nil)
    @stage.save()
  end

  describe ('#==') do 
    it ('is the same artist if it has the same attributes as another artist') do
      artist = Artist.new("Foals", @stage.id, nil)
      artist2 = Artist.new("311", @stage.id, nil)
      expect(artist).to(eq(artist2))
    end
  end

  describe('.all') do 
    it('returns a list of all songs') do 
      artist = Artist.new("Foals", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("311", @stage.id, nil)
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe ('#save') do 
    it('saves a song') do 
      artist = Artist.new("Foals", @stage.id, nil)
      artist.save()
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe ('.find') do 
    it ('finds a song by id') do 
      song = Song.new("Giant Steps", @album.id, nil)
      song.save()
      song2 = Song.new("Naima", @album.id, nil)
      song2.save()
      expect(Song.find(song.id)).to(eq(song))
    end
  end

  describe ('#update') do 
  it('updates a song by id') do
    song = Song.new("Naima", @album.id, nil)
      song.save()
      song.update("Mr. P.C.", @album.id)
      expect(song.name).to(eq("Mr. P.C."))
    end
  end

  describe ('#delete') do 
    it ('deletes a song by id') do 
      song = Song.new("Giant Steps", @album.id, nil)
      song.save()
      song2 = Song.new("Naima", @album.id, nil)
      song2.save()
      song.delete()
      expect(Song.all).to(eq([song2]))
    end
  end

  describe('.find_by_album') do
    it("finds songs for an album") do
      album2 = Album.new("Blue", nil)
      album2.save
      song = Song.new("Naima", @album.id, nil)
      song.save()
      song2 = Song.new("California", album2.id , nil)
      song2.save()
      expect(Song.find_by_album(album2.id)).to(eq([song2]))
    end
  end

  describe('#album') do
    it("finds the album a song belongs to") do
      song = Song.new("Naima", @album.id, nil)
      song.save()
      expect(song.album()).to(eq(@album))
    end
  end

end
