class Api::V1::ArticlesController < Api::V1::ApiController

    def show
        @article = Article.find(params[:id])
    end 
end 