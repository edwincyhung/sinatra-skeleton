helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id] 
  end
end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/profile' do
  erb :profile
end

get '/signup' do
  erb :signup
end

get '/reviews/new' do
  erb :new_review
end

post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email)
  if password == user.password
    session[:user_id] == user.id
    redirect '/'
  else
    redirect '/login'
  end
end

post '/profile' do
  redirect '/'
end

post '/signup' do
  username = params[:username]
  email = params[:email]
  password  = params[:password]
  check_email == User.find_by(email: email)
  check_user == User.find_by(username: username)
    if check_email
      redirect '/signup'
    elsif check_user
      redirect '/signup'
    else
      user = User.create(
        username: username, email: email, password: password
        )
      session[:user_id] = user.id
      redirect '/'
    end
end

post '/reviews/new' do
  rating = params[:rating]
  comment = params[:comment]
  item_id = params[:item_id]

  review = current_user.Review.create(
    rating: rating, comment: comment, item_id: item_id
    )
  redirect '/reviews'
end
