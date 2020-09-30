class Artist 
  attr_reader :id 
  attr_accessor :name, :stage_id

  @@artists = {}
  @@total_rows = 0 

  def initialize(name, stage_id, id)
    @name = name 
    @stage_id = stage_id
    @id = id || @@total_rows += 1
  end

  def ==(artist_to_compare)
    (self.name() == artist_to_compare.name()) && (self.stage_id() == artist_to_compare.stage_id())
  end

  def self.all
    @@artists.values 
  end

  def save 
    @@artists[self.id] = Artist.new(self.name, self.stage_id, self.id)
  end

  def self.find(id)
    @@artists[id]
  end

  def update(name, stage_id)
    self.name = name 
    self.stage_id = stage_id 
    @@artists[self.id] = Artist.new(self.name, self.album_id, self.id)
  end

  def delete 
    @@artists.delete(self.id)
  end

  def self.clear 
    @@artists ={}
  end

  def self.find_by_album(stage_id)
    artists = []
    @@artists.values.each do |artist|
      if artist.stage_id == stage_id
        artists.push(artist)
      end
    end
    artists
  end

  def stage
    Stage.find(self.stage_id)
  end



end