class ApplicationController < ActionController::Base
  def check_token
    jwt_payload = JWT.decode(current_user.jwt_key, 'supersecret').first
    if jwt_payload['timestamp'] > 5.minutes.ago
      current_user.generate_jwt
    else
      current_user.delete_jwt
      sign_out
    end
  end  
end
