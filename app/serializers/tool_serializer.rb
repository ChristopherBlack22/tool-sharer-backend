class ToolSerializer #< ActiveModel::Serializer
  #attributes :id, :name, :description, :image_url, :owner_id, :borrower_id, :category

  def initialize(tools_object)
    @tools = tools_object
  end

  def to_serialized_json
    options = {
      include: {
        owner: {
          only: [:id, :username, :email]
        },
        borrower: {
          only: [:id, :username, :email]
        },
        category: {
          only: [:id, :name]
        }
      },
      only: [:id, :name, :description, :image_url]
    }
    @tools.to_json(options)
  end 
end
