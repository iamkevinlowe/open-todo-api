class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password

  validates :username, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true, on: :create

  has_many :lists, dependent: :destroy

  def self.authenticate(username, password)
    user = User.where(username: username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
