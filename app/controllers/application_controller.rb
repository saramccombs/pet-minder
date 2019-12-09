require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    if logged_in?
      @user = current_user
      erb :welcome
    else
      erb :welcome
    end
  end

  get "/search" do
    erb :search
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      unless logged_in?
        redirect '/login'
      end
    end

    def current_user
      User.find(session[:user_id])
    end
  end

  get '/login' do
    erb :login
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  post '/login' do
    # Find the user with this username
    @user = Account.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/"
    else
      @error = "Invalid username or password"
      erb :failure
    end
  end

  private

  def user_params
    { username: params[:username], password: params[:password] }
  end

end
