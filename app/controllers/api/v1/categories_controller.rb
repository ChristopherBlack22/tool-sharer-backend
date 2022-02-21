class Api::V1::CategoriesController < ApplicationController
    
    def index
        categories = Category.all
        tools = Tool.all
       
        render json: {
            categories: CategorySerializer.new(categories).to_serialized_json,
            tools: ToolSerializer.new(tools).to_serialized_json
        }
    end 

end
