module Optimadmin
  class ArticlesController < Optimadmin::ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    edit_images_for Article, [
      [:image, { index: ['fill', 325, 145], show: ['fill', 300, 300], sidebar: ['fill', 50, 50] }]
    ]

    def index
      @articles = Article.order(params.fetch(:order, date: :desc))
                         .field_search(params[:search])
                         .page(params[:page]).per(params.fetch(:per_page, 15))
    end

    def show
    end

    def new
      @article = Article.new(date: Date.today)
    end

    def edit
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to_index_or_continue_editing(@article)
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to_index_or_continue_editing(@article)
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private

    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article)
            .permit(:title, :summary, :content, :image, :date, :display,
                    :home_highlight, :author_id, :url_originallly_posted_on,
                    :remove_image, :remote_image_url, :image_cache, category_ids: [])
    end
  end
end
