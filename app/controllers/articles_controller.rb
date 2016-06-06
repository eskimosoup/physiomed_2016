class ArticlesController < ApplicationController
  def index
    @articles = Article.displayed.order(date: :desc)
  end

  def show
    @article = Article.displayed.friendly.find(params[:id])
  end
end
