class ApplicationController < ActionController::API
  include Response
  include Pundit
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  private

    def authenticate
      authenticate_user_with_token || handle_bad_authentication
    end

    def authenticate_user_with_token
      authenticate_with_http_token do |token, options|
        @user = User.last
        @user.api_keys[0]["token"] == token
        # @user ||= User.find_by(api_key: token)
      end
    end

    def handle_bad_authentication
      render json: { message: "Bad credentials" }, status: :unauthorized
    end

    def handle_not_found
      render json: { message: "Record not found" }, status: :not_found
    end

  # def authorize
  #   if !(current_user && current_user.api_key)
  #     redirect_to '/signin'
  #   end
  # end

  # def authorize_admin
  #   if !(current_user && current_user.admin)
  #     redirect_to '/signin'
  #   end
  # end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :not_found)
  end
end
