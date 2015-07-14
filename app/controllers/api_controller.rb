class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  private

  def authenticated?
    authenticate_or_request_with_http_basic {|username, password| User.where( username: username, password_hash: password_hash(username, password)).present? }
  end

  def password_hash(username, password)
    user = User.where(username: username).first
    BCrypt::Engine.hash_secret(password, user.password_salt)
  end
end
