class User < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :lists, dependent: :destroy

  def self.authenticate(username, password)
    user = User.where(username: username).first
    if user && user.password == password
      user
    else
      nil
    end
  end
end
