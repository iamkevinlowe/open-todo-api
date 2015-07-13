class List < ActiveRecord::Base

  validates :name, presence: true
  validates :permissions, presence: true

  belongs_to :user
  has_many :items, dependent: :destroy
end
