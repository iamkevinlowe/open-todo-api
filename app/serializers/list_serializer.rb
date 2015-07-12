class ListSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :permissions

  has_many :items

end
