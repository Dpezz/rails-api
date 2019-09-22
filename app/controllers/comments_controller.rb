class CommentsController < ApplicationController

    def index
        render json: Comment.all
    end

    def create
        obj = Comment.new(model_params)
        if obj.save
            render json: obj
        else
            render json: obj.errors, status: :unprocessable_entity
        end
    end
    
    def show
        obj = Comment.find(params[:id])
        render json: obj, :include => :article
    end

    def update
        obj = Comment.find(params[:id])
        if obj.update(model_params)
            render json: obj
        else
            render json: obj.errors, status: :unprocessable_entity
        end
    end
       
    def destroy
        obj = Comment.find(params[:id])
        obj.destroy
        render json: obj
    end

    private
        def model_params
          params.require(:comment).permit(:body, :article_id)
        end

end
