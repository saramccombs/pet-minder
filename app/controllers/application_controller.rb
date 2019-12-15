require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash, :sweep => true
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
    redirect_if_not_logged_in
    erb :search
  end

  get '/login' do
    erb :login
  end

  get '/logout' do
    session.clear
    erb :logout
  end

  post '/login' do
    # Find the user with this username
    @user = Account.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.user_id
      redirect to "/"
    else
      @error = ["Invalid username or password"]
      erb :failure
    end
  end

  get '/delete' do
    redirect_if_not_logged_in
    flash[:notice] = "You have successfully deleted your account."
    flash[:notice]
    session.clear
    erb :delete
  end 

  # Leaving this in here. Attempts to create a search feature.
  # Appears that Postgres has some functionality for this but I will
  # wait to implement until depolyment occurs since I want to maintain
  # a SQLite version in master. 
  #
  # post '/results' do
  #   if params[:search] == "pet"
  #     @results = Pet.where('name LIKE ?', params[:name])
  #     binding.pry
  #     erb :results
  #   elsif params[:search] == "owner"
  #     @results = User.where('name LIKE ?', params[:name])
  #     binding.pry
  #     erb :results
  #   else
  #     @error = ["Invalid search, please try again."]
  #     erb :failure
  #   end
  # end

# HELPER METHODS

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      unless logged_in?
        flash[:notice] = "Please login to continue."
        flash[:notice]
        redirect to '/login'
      end
    end

    def redirect_if_cannot_edit(model_id)
      unless model_id == current_user.id
        flash[:notice] = "Permission Denied."
        flash[:notice]
        redirect to "/users"
      end
    end

    def current_user
      User.find(session[:user_id])
    end

    def delete_account(id)
      @user = User.find(id)
      @account = Account.find_by(user_id: id)
      @pets = Pet.where(user_id: id)
      @pets.each {|pet| pet.destroy }
      @user.destroy
      @account.destroy
      # session cleared upon redirect to the delete erb to persist flash message confirmation of account deletion.
    end
  end

  # PRIVATE METHODS
  private

  def user_params
    { username: params[:username], password: params[:password] }
  end

end
