helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

before do
  redirect '/login' if !current_user && request.path != '/login' && request.path != '/signup'
end

# Homepage (Root path)
get '/' do
  erb :index
end

get "/login" do
  erb :login
end

post "/login" do
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email, password: password)
  if user.password == password
     user.email == email
     session[:user_id] = user.id
     redirect "/"
  else
     redirect "/login"
  end
end

get "/signup" do
  erb :signup
end

post "/signup" do
  first_name = params[:first_name]
  last_name = params[:last_name]
  email = params[:email]
  password = params[:password]
  password_confirmation = params[:password_confirmation]

  user = User.find_by(email: email, password: password)
  if user
    redirect "/login"
  else
    new_user = User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    session[:user_id] = user.id
    redirect "/"
  end
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  erb :'tracks/show'
end

post '/tracks' do
  @track = Track.new(
    artist: params[:artist],
    title: params[:title],
    url: params[:url]
    )
  if @track.save
    redirect '/tracks'
  else 
    erb :'/tracks/new'
  end
end
