class CategorySerializer

  def initialize(categories_object)
    @categories = categories_object
  end

  def to_serialized_json
    options = {
      :except => [:created_at, :updated_at]
    }
    @categories.to_json(options)
  end 

end
