class UsersController < ApplicationController
    #View all users
    get '/users' do
        redirect_if_not_logged_in
        @users = User.all
        erb :'/users/index'
    end
    
    # Create new user
    get '/users/new' do
        erb :'/users/new'
    end
    
    post '/users' do
        @user = User.new(user_params)
        if @user.save 
            @account = Account.new(account_params(@user.id))
            @account.id = @user.id
            if @account.save
                session[:user_id] = @user.id
                redirect to "/"
            else
                @error = @account.errors.full_messages
                @user.destroy
                erb :failure
            end
        else
            @error = @user.errors.full_messages
            erb :failure
        end
    end

    # View one user
    get '/users/:id' do
        redirect_if_not_logged_in
        @user = User.find(params[:id])
        erb :'/users/show'
    end
    
    # Edit existing user
    get '/users/:id/edit' do
        redirect_if_not_logged_in
        @user = User.find(params[:id])
        @pets = Pet.all
        redirect_if_cannot_edit(@user.id)
        erb :'/users/edit'
    end
    
    patch '/users/:id' do
        @user = User.find(params[:id])
        @user.update(params[:user])
        redirect "/users/#{@user.id}"
    end

    def user_params
        { name: params[:user][:name], phone: params[:user][:phone], email: params[:user][:email] }
    end

    def account_params(user_id)
        account = params[:account]
        account[:user_id] = user_id
        account
    end

end
