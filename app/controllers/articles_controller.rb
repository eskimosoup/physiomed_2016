class ArticlesController < ApplicationController
  def index
    @articles = Article.displayed.order(date: :desc).page(params[:page]).per(10)
  end

  def show
    @article = Article.displayed.friendly.find(params[:id])
  end
end
