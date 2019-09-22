class ArticlesController < ApplicationController

    def index
        render json: Article.all
    end

    def create
        article = Article.new(article_params)
        if article.save
            render json: article
        else
            render json: { status: 500, code: 500, error: article.errors, exception: article.errors.messages }
        end
    end

    def show
        article = Article.find(params[:id])
        render json: article
    end

    def update
        article = Article.find(params[:id])
        if article.update(article_params)
            render json: article
        else
            render json: { status: 500, code: 500, error: article.errors, exception: article.errors.messages }
        end
    end
       
    def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: article
    end

    private
        def article_params
          params.require(:article).permit(:title, :text)
        end
end
