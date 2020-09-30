require 'rspec'
require 'stage'
require 'pry'

describe '#Stage' do 

  before(:each) do 
    Stage.clear()
  end

  describe('#save') do 
  it("saves an instance of stage") do 
    stage = Stage.new("Mayfield Stage", nil)
    stage.save()
    stage2 = Stage.new("SRV Stage", nil)
    stage2.save()
    expect(Stage.all).to(eq([stage,stage2]))
  end
end

  describe('.all') do 
    it('returns an empty array when there are no stages') do
      expect(Stage.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all stages") do
      stage = Stage.new("Mayfield Stage", nil)
      stage.save()
      stage2 = Stage.new("SRV Stage", nil)
      stage2.save()
      Stage.clear()
      expect(Stage.all).to(eq([]))
    end
  end
  
  describe('#==') do
    it("is the same stage if it has the same attributes as another stage") do
      stage = Stage.new("Mayfield Stage", nil)
      stage2 = Stage.new("Mayfield Stage", nil)
      expect(stage).to(eq(stage2))
    end
  end

  describe('.find') do
    it("finds a stage by id") do
      stage = Stage.new("Mayfield Stage", nil)
      stage.save()
      stage2 = Stage.new("SRV Stage", nil)
      stage2.save()
      expect(Stage.find(stage.id)).to(eq(stage))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      stage = Stage.new("Mayfield Stage", nil)
      stage.save()
      stage.update("SRV Stage")
      expect(stage.name).to(eq("SRV Stage"))
    end
  end

  describe('#delete') do
    it("deletes a stage by id") do
      stage = Stage.new("Mayfield Stage", nil)
      stage.save()
      stage2 = Stage.new("SRV Stage", nil)
      stage2.save()
      stage.delete()
      expect(Stage.all).to(eq([stage2]))
    end
  end

  #describe('#artists') do
    #it("returns a stages artists") do
      #stage = Stage.new("Mayfield Stage", nil)
      #stage.save()
      #artist = Artist.new("Foals", stage.id, nil)
      #artist.save()
      #artist2 = Artist.new("311", stage.id, nil)
      #artist2.save()
      #expect(album.songs).to(eq([song, song2]))
    #end
  #end
end