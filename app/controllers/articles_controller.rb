class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :edit]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
  end

  def create
    article = Article.create!(article_params)
    flash[:success] = "#{article.title} has been created!"

    redirect_to article_path(article)
  end

  def edit
  end

  def update
    @article.update(article_params)
    flash[:success] = "#{@article.title} has been updated!"

    redirect_to article_path(@article)
  end

  def destroy
    article = Article.destroy(params[:id])
    flash[:success] = "#{article.title} has been deleted!"


    redirect_to '/articles'
  end

  private

  def article_params
    params.permit(:title, :body, :tag_list)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
