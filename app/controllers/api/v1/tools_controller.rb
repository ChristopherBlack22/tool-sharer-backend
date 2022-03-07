class Api::V1::ToolsController < ApplicationController

    def index
        tools = Tool.all
        render json: {
            tools: ToolSerializer.new(tools).to_serialized_json
        },
        status: :ok
    end

    def create
        tool = Tool.new(tool_params)
        if tool.save
            render json: {
                tool: ToolSerializer.new(tool).to_serialized_json
            },
                status: :created
        else
            validation_errors = tool.errors.full_messages.join(". ")
            render json: {
                error: "Unable to create tool. #{validation_errors}."
            },
            status: :unprocessable_entity
        end
    end 
    
    def update
        tool = Tool.find_by(id: params[:id])
        tool.update(tool_params)
        render json: {
            tool: ToolSerializer.new(tool).to_serialized_json
        },
        status: :ok
    end

    def destroy
        tool = Tool.find_by(id: params[:id])
        tool.delete
        tools = Tool.all
        render json: {
                tools: ToolSerializer.new(tools).to_serialized_json
        },
        status: :ok
    end
 
    private

    def tool_params
        params.require(:tool).permit(:id, :name, :description, :image_url, :owner_id, :borrower_id, :category_id)
    end

end
