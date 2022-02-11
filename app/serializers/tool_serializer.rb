class ToolSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url, :owner_id, :borrower_id, :category
end
