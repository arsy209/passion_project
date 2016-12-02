get '/playlists/all' do
   @playlists = Playlist.all
    erb :"/playlist/all"
end


post '/playlists/all' do
  user = current_user
  user.playlists.create(name: params[:name])
  redirect to ("/my_playlists")
end


get '/my_playlists' do
    user = current_user
    @playlists = user.playlists
    erb :"/playlist/all"
end


get '/playlists/:id' do |id|
    @playlist = Playlist.find(id)
    @songs = @playlist.songs
    erb :"/playlist/one"
end

put '/playlists/:id' do |id|
  playlist = Playlist.find(id)
  playlist.update(params[:playlist])
  redirect("/playlists/#{id}")
end


delete '/playlists/:id' do |id|
  playlist = Playlist.find(id)
  playlist.destroy
  redirect to ('/my_playlists')
end
