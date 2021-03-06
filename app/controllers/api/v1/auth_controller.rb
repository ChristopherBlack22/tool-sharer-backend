class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: user_login_params[:username])

        if user && user.authenticate(user_login_params[:password])
            token = encode_token(user_id: user.id) #if user exists and password matches create a token using its id
            render json: {
                user: UserSerializer.new(user),
                jwt: token
            },
            status: :accepted
        else
            render json: {
                error: "Incorrect Username or Password"
            },
            status: :unauthorized
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end

end