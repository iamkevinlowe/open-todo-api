class List < ActiveRecord::Base

  validates :name, presence: true
  validates :permissions, presence: true, inclusion: { in: %w(private viewable open) }

  belongs_to :user
  has_many :items, dependent: :destroy
end
