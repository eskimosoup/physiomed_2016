module ClientZone
  class ArticlesController < BaseController
    def index
      @additional_content = AdditionalContent.displayed.find_by(area: 'articles')
      @articles = Article.displayed_on_client_zone.order(date: :desc).page(params[:page]).per(10)
    end

    def show
      @article = Article.displayed_on_client_zone.friendly.find(params[:id])
    end
  end
end
