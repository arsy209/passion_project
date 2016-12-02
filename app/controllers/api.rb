get '/soundcloud' do
@tracks = CLIENT.get('/tracks', :q => params[:search], :licence => 'cc-by-sa')
erb :'/api/soundcloud'
end
