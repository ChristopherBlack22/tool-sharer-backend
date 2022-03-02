class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    
    def create
        user = User.new(user_params)
        if user.save
            token = encode_token(user_id: user.id) #if a valid user is created and saved create a token using its id
            render json: {
                user: UserSerializer.new(user),
                jwt: token
            },
            status: :created
        else
            validation_errors = user.errors.full_messages.join(". ")
            render json: {
                error: "Unable to create user. #{validation_errors}."
            },
            status: :unprocessable_entity
        end
    end



    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
