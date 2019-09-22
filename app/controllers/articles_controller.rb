class ArticlesController < ApplicationController

    def index
        render json: Article.all
    end

    def create
        obj = Article.new(model_params)
        if obj.save
            render json: obj
        else
            render json: obj.errors, status: :unprocessable_entity
        end
    end

    def show
        obj = Article.find(params[:id])
        render json: obj, :include => :comments
    end

    def update
        obj = Article.find(params[:id])
        if obj.update(article_params)
            render json: obj
        else
            render json: obj.errors, status: :unprocessable_entity
        end
    end
       
    def destroy
        obj = Article.find(params[:id])
        obj.destroy
        render json: obj
    end

    private
        def model_params
          params.require(:obj).permit(:title, :text)
        end
end
