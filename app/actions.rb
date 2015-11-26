before do
  redirect '/login' if !current_user && request.path != '/login' && request.path != '/signup'
end

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/profile' do
  if current_user
    erb :profile
  else
    redirect '/'
  end
end

get '/reviews/new' do
  erb :new_review
end

get '/restaurants' do
  erb :restaurants
end

get '/restaurants/new' do
  erb :new_restaurants
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/reviews' do
  @reviews = Review.all.reverse
  erb :reviews
end

get '/reviews/:id' do
  @review = Review.find(params[:id])
  erb :reviews
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :restaurants
end

post '/login' do
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email, password: password)
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
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

post '/restaurants/create' do
  name = params[:name]
  street = params[:street]
  city = params[:city]

  restaurant = Restaurant.create(name: name, street: street, city: city)

  redirect '/restaurants'
end

post '/profile/edit' do
  username = params[:username]
  email = params[:email]
  password = params[:password]

  current_user.update username: username, email: email, password: password

  redirect '/profile'
end
