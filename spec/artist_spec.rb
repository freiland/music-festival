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
      expect(artist2).to(eq(artist2))
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
    it ('finds a artist by id') do 
      artist = Artist.new("Foals", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("311", @stage.id, nil)
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe ('#update') do 
  it('updates a artist by id') do
    artist = Artist.new("Foals", @stage.id, nil)
      artist.save()
      artist.update("311", @stage.id)
      expect(artist.name).to(eq("311"))
    end
  end

  describe ('#delete') do 
    it ('deletes a artist by id') do 
      artist = Artist.new("Foals", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("311", @stage.id, nil)
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('.find_by_album') do
    it("finds songs for an album") do
      stage2 = Stage.new("Mayfield Stage", nil)
      stage2.save
      artist = Artist.new("Foals", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("311", stage2.id, nil)
      artist2.save()
      expect(Artist.find_by_stage(stage2.id)).to(eq([artist2]))
    end
  end

  describe('#album') do
    it("finds the album a song belongs to") do
      artist = Artist.new("311", @stage.id, nil)
      artist.save()
      expect(artist.stage()).to(eq(@stage))
    end
  end

end
