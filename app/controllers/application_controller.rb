class ApplicationController < ActionController::API
    before_action :authorized

    @secret = "Flatiron_School_Module_5" #Move to environment variable dotenv-rails?


    def encode_token(payload)
        #payload is {user_id: user.id}
        JWT.encode(payload, @secret, "HS256")
    end


    def auth_header
        #requesting header Authorization: Bearer <token>
        auth_header = request.headers["Authorization"]
    end 

    def decode_token
        if auth_header
            token = auth_header.split(" ")[1] #split the value to create an array and access the second element
            begin
                JWT.decode(token, @secret, true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end 

    def current_user
        if decode_token
            # if token can be decoded, and not result in nil. decoded_token is [{user_id: <user_id>}, {"alg"=>"HS256"}]
            user_id = decoded_token[0]["user_id"]
            user = User.find_by(id: user_id)
        end 
    end 

    def logged_in?
        !!current_user
        #turns current_user into a boolean
    end

    def authorized
        unless logged_in?
            render json: {message: "You are not logged in"}, status: :unauthorized
        end 
    end 

end
