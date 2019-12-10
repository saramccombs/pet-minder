class PetsController < ApplicationController
    # Create new pet
    get '/pets/new' do
        redirect_if_not_logged_in
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
        redirect_if_not_logged_in
        if @user.find(params[:id]) == current_user.id
            @pet = Pet.find(params[:id])
            erb :'/pets/edit'
        else
            redirect to "/users"
        end
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

    def pet_params(user_id)
        pet = params[:pet]
        pet[:user_id] = user_id
        pet
    end

end
