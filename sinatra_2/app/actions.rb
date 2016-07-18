# Homepage (Root path)
require 'pry'
require 'securerandom'

get '/' do
  erb :index
end

get '/register' do
	erb :register
end

post '/login' do
  @songs = Song.all
  redirect '/songs'
end

post '/register' do
  redirect '/songs'
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'/songs/new'
end

post '/songs/new' do
  @song = Song.create(
    artist: params[:artist],
    title: params[:title],  
    url: params[:url] 
    )
    @song.save
	redirect ('/songs')
 # @song.save ? redirect ('/songs') : erb :'songs/new'
end



