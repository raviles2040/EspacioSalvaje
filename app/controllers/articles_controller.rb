class ArticlesController < ApplicationController
    #GET /articles
    def index
        @articles = Article.all 
    end
    #GET /articles/:id
    def show
        @article = Article.find(params[:id])
        Article.where("id = ?", params[:id])
        @article.update_visits_count
        @comment = Comment.new
    end
    #GET /articles/new
    def new
        @article = Article.new
    end
    #POST /articles
    def create
        @article = current_user.articles.new(article_params)
        if @article.validate
            @article.save
            redirect_to @article
        else
            render :new
        end
    end
    def edit
        @article = Article.find(params[:id])
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to @article
    end
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    private
    def article_params
        params.require(:article).permit(:title,:body,:categoria)
    end
    
    #Le decimos que los campos en los cuales el usuario puede actuar es el title y el body, básicamente para evitar posibles ataques.
end