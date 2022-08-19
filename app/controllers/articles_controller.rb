class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    article = Article.create!(article_params)

    redirect_to article_path(article)
  end

  def destroy
    Article.destroy(params[:id])

    redirect_to '/articles'
  end

  private

  def article_params
    params.permit(:title, :body)
  end

end
