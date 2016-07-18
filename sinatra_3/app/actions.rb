# Homepage (Root path)
get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :index
end

get '/sign_up' do
  erb :sign_up
end

get '/log_in' do
  erb :log_in
end

get '/log_out' do
  session.delete(:user_id)
  redirect '/'
end

get '/tracks' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/:id' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @track = Track.find(params[:id])
  erb :'tracks/show'
end

post '/tracks' do
  @vote = Vote.new(
    track_id: params[:track_id],
    user_id: params[:user_id]
    )
  if @vote.save
    redirect '/tracks'
  else
    flash[:errors] = @vote.errors.messages
    redirect '/tracks'
  end
end

get '/tracks/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :'tracks/new'
end

get '/tracks/classic_rock' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @tracks = Track.where(category: 'classic_rock')
  erb :'tracks/classic_rock'
end

get '/tracks/new_music' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @tracks = Track.where(category: 'new_music')
  erb :'tracks/new_music'
end

get '/tracks/hip_hop' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @tracks = Track.where(category: 'hip_hop')
  erb :'tracks/hip_hop'
end


post '/sign_up' do
  @user = User.new(
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password]
  )
  if @user.save
    redirect '/log_in'
  else
    erb :sign_up
  end
end

post '/log_in' do
  if @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/log_in'
  end
end

post '/new' do
  @track = Track.new(
    title: params[:title],
    artist: params[:artist],
    url: params[:url],
    category: params[:category],
    created_by: params[:created_by]
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end