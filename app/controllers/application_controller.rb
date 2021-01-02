class ApplicationController < ActionController::API
     def current_user
      # byebug
        begin
          @current_user ||= User.find_by(id: decode_token_and_get_user_id)
        rescue
          return nil
        end
      end
    
      def logged_in?
        !!current_user
      end
    
      def generate_token(payload)
        # byebug
        JWT.encode(payload, ENV['JWT_TOKEN_SECRET'])
      end
    
      def decode_token_and_get_user_id
        # byebug
        token = request.headers["Authorization"].gsub("Bearer ", "")
        JWT.decode(token, ENV['JWT_TOKEN_SECRET'])[0]["id"]
      end
    
end


