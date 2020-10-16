class ArticlesController < ApplicationController
    include ArticlesHelper

    def index
        @articles = Article.all
    end

    def show
        @comment = Comment.new
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save

        flash.notice = "Successfully created Article '#{@article.title}'"

        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        flash.notice = "Deleted Article '#{@article.title}'"

        redirect_to articles_path
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' updated!"

        redirect_to articles_path(@article)
    end
end
