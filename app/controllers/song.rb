
get '/my_songs' do
  logged_in?
  user = current_user
  @songs = user.songs
  erb :"/song/my_songs"
end


post '/my_songs' do
  song = params[:song]
  playlist = Playlist.find(song[:playlist_id])
  playlist.songs.create(title: song[:title],song_url: song[:song_url], user_id: current_user.id)
  redirect("/playlists/#{song[:playlist_id]}")
end

get '/songs/:id' do |id|
  logged_in?
    @song = Song.find(id)
    @playlist = @song.playlist
    p @playlist
    erb :"/song/one"
end


put '/songs/:id' do |id|
  @song = Song.find(id)
  @song.update(params[:song])
  if request.xhr?
    erb :'/song/one'
  else
    redirect("/songs/#{id}")
  end
end

delete '/songs/:id' do |id|
  song = Song.find(id)
  @playlist_id = song.playlist_id
  song.destroy
  redirect("/playlists/#{@playlist_id}")
end