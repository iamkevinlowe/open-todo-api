class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  private

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      user = User.authenticate(username, password)
      if user.present?
        @current_user = user
        return true
      else
        return false
      end
    end
  end

  def password_hash(username, password)
    user = User.where(username: username).first
    BCrypt::Engine.hash_secret(password, user.password_salt)
  end
end
