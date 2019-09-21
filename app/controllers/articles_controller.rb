class ArticlesController < ApplicationController

    def index
        render json: Article.all
    end

    def create
        @article = Article.new(article_params)
        # if 
            @article.save
            render json: @article
        # end
        # render json: {status: 500, code: 500, error: @article.errors, exception: @article.errors.messages}
    end
       
    private
        def article_params
          params.require(:article).permit(:title, :text)
        end
end
