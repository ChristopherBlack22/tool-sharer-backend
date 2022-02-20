class Api::V1::ToolsController < ApplicationController
    
    def index
        tools = Tool.all
        render json: ToolSerializer.new(tools)
        #improve serialized data
    end 

end
