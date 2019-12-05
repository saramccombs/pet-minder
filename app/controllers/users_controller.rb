class UsersController < ApplicationController
    #View all users
    get '/users' do
        @users = User.all
        erb :'/users/index'
    end
    
    # Create new user
    get '/users/new' do
        erb :'/users/new'
    end
    
    post '/users' do
        @user = User.new(params[:user])
        if @user.save
            @account = Account.create(params[:account])
            @account.user_id = @user.id
            redirect to "/users/#{@user.id}"
        else
            @error = ["Signup Failed, please try again."]
            erb :failure
        end
    end

    # View one user
    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end
    
    # Edit existing user
    get '/users/:id/edit' do
        @user = User.find(params[:id])
        @pets = Pet.all
        erb :'/users/edit'
    end
    
    patch '/users/:id' do
        @user = User.find(params[:id])
        @user.update(params[:user])

        
        redirect "/users/#{@user.id}"
    end

end