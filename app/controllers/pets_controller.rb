class PetsController < ApplicationController
    # Create new pet
    get '/pets/new' do
        erb :'/pets/new'
    end
    
    post '/pets' do
        @pet = Pet.new(pet_params(current_user.id))
        if @pet.save
            redirect to "/users/#{current_user.id}"
        else
            @error = ["Failed to add your pet, please try again."]
            erb :failure
        end
    end

    get '/pets/:id/edit' do
        @pet = Pet.find(params[:id])
        erb :'/pets/edit'
    end

    patch '/pets/:id' do
        @pet = Pet.find(params[:id])
        if @pet.update(params[:pet])
            redirect to "/users/#{@pet.user_id}"
        else
            @error = ["Failed to update your pet, please try again."]
            erb :failure
        end
    end

    # # View one user
    # get '/users/:id' do
    #     @user = User.find(params[:id])
    #     erb :'/users/show'
    # end
    
    # # Edit existing user
    # get '/users/:id/edit' do
    #     @user = User.find(params[:id])
    #     @pets = Pet.all
    #     erb :'/users/edit'
    # end
    
    # patch '/users/:id' do
    #     @user = User.find(params[:id])
    #     @user.update(params[:user])
    #     redirect "/users/#{@user.id}"
    # end


    def pet_params(user_id)
        pet = params[:pet]
        pet[:user_id] = user_id
        pet
    end

end
