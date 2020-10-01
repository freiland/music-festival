require('sinatra')
require('sinatra/reloader')
require('./lib/artist')
require('./lib/stage')
require('pry')
also_reload('lib/**/*.rb')

get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end

get('/') do
  
  @stages = Stage.new("SRV Stage", nil)
  @stages.save()
  @stages = Stage.new("Mayfield Stage", nil)
  @stages.save()
  @stages = Stage.new("Showco Stage", nil)
  @stages.save()
  
  @stages = Stage.all
  
  erb(:stages)
end

get('/stages') do
  @stages = Stage.all
  erb(:stage)
end



post('/stages/artists') do 
artist_name = params[:artist_name]
artist = Artist.new(name, nil)
artist.save()
@artists = Artist.all()
erb(:stages)
end
  

get ('/artists/:id') do 
  @stages = Stage.find(params[:id].to_i())
  erb(:artists)
end

get ('/artists/:id/new') do 
@stages = Stage.all

erb(:new_artist)
end

get ('/artists/') do 
  #@stages = Stage.find(params[:id].to_i())
  erb(:artists)
end

get ('/artists/new') do 
erb(:test)
end

post('/artist/:id') do
  #@stages = Stage.find(params[:id].to_i())
  artist = Artist.new(params[:artist_name], 2, nil)
  artist.save()
  erb :album
  
  erb(:artists)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end


patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end

# Get the detail for a specific song such as lyrics and songwriters.
get ('/albums/:id/songs/:song_id') do 
  @song = Song.find(params[:song_id].to_i())
  erb :song 
end

  # Post a new song. After the song is added, Sinatra will route to the view for the album the song belongs to.
post('/albums/:id/songs') do
  @album = Album.find(params[:id].to_i())
  song = Song.new(params[:song_name], @album.id, nil)
  song.save()
  erb :album
end


# Edit a song and then route back to the album view.

patch ('/albums/:id/songs/:song_id') do 
  @album = Album.find(params[:id].to_i())
  song = Song.find(params[:song_id].to_i())
  song.update(params[:name], @album.id)
  erb(:album)
end

# Delete a song and then route back to the album view.
delete('/albums/:id/songs/:song_id') do
  song = Song.find(params[:song_id].to_i())
  song.delete
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end
