class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
  end

  def create
    article = Article.create!(article_params)

    redirect_to article_path(article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    Article.destroy(params[:id])

    redirect_to '/articles'
  end

  private

  def article_params
    params.permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
