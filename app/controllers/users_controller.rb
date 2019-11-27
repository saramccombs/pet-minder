class UsersController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'/users/index'
    end
    
    # Completely new user account
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
    
    get '/users/:id/edit' do
        @user = Owner.find(params[:id])
        @pets = Pet.all
        erb :'/users/edit'
    end
    
    get '/users/:id' do
        @user = Owner.find(params[:id])
        erb :'/users/show'
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