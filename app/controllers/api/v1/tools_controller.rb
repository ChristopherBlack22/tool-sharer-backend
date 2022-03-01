class Api::V1::ToolsController < ApplicationController
    
    def update
        tool = Tool.find_by(id: params[:id])
        tool.update(tool_params)
        render json: {
            tool: ToolSerializer.new(tools).to_serialized_json
        },
        status: :ok
    end
 
    private

    def tool_params
        params.require(:tool).permit(:name, :description, :image_url, :owner_id, :borrower_id, :category_id)
    end

end
