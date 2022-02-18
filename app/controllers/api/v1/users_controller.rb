#require "pry"

class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    
    def create
        params.inspect
        user = User.new(user_params)
        #binding.pry
        if user.save
            token = encode_token(user_id: user.id) #if a valid user is created and saved create a token using its id
            render json: {
                #### What data needs to be sent, create a serializer
                user: UserSerializer.new(user),
                jwt: token
            },
            status: :created
        else
            render json: {
                error: "Unable to create user"
            },
            status: :unprocessable_entity
        end
    end



    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
