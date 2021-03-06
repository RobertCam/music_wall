helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!@current_user
  end
end

# before do
#   redirect '/login' if !current_user && request.path != '/login' && request.path != '/signup'
# end

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
  if user && user.password == password
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
    session[:user_id] = user.id
    redirect '/'
  else
    new_user = User.create(first_name: first_name, last_name: last_name, email: email, password: password)
    session[:user_id] = new_user.id
    redirect "/"
  end
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

post "/upvote" do
  @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  @track = Track.find params[:track]
  # unless Upvote.find(:user_id) == @current_user.id && Upvote.find(:track_id) == @track.id
    Upvote.create(user_id: @current_user.id, track_id: params[:track_id])
    redirect '/tracks'
  # end
end

post "/upvote_review" do
  @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  @review = Review.find params[:review]
  # unless Upvote.find(:user_id) == @current_user.id && Upvote.find(:track_id) == @track.id
    Upvote.create(user_id: @current_user.id, review_id: params[:review])
    redirect '/tracks'
  # end
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

get '/tracks/:id' do
  @reviews = Review.all 
  @track = Track.find params[:id]
  erb :'tracks/show'
end

post '/review' do
  @review = Review.new(
    user_id: session[:user_id],
    track_id: params[:track_id],
    title: params[:title],
    content: params[:content]
    )
  @review.save
  redirect '/tracks'
end

post '/tracks' do
  @track = Track.new(
    artist: params[:artist],
    title: params[:title],
    url: params[:url],
    user_id: session[:user_id]
    )
  if @track.save
    redirect '/tracks'
  else 
    erb :'/tracks/new'
  end
end

post '/delete' do
  @track = Track.find params[:delete]
  @track.destroy
  redirect '/tracks'  
end

post '/delete_review' do
  @review = Review.find params[:delete]
  @review.destroy
  redirect '/tracks'  
end

get '/logout' do
  session.clear
  redirect "/login"
end
