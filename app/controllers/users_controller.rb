class UsersController < ApplicationController
    #View all users
    get '/users' do
        @users = User.all
        erb :'/users/index'
    end
    
    # Create new user
    get '/users/new' do
        @pets = Pet.all
        erb :'/users/new'
    end
    
    post '/users' do
        @user = User.create(params[:user])
        if !params["pet"]["name"].empty?
            @user.pets << Pet.create(name: params["pet"]["name"])
        end
        redirect "/users/#{@user.id}"
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
        @user = Owner.find(params[:id])
        @user.update(params[:user])
        
        if !params["pet"]["name"].empty?
            @user.pets << Pet.create(name: params["pet"]["name"])
        end
        
        redirect "/users/#{@user.id}"
    end

    
end