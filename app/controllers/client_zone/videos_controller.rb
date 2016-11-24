module ClientZone
  class VideosController < BaseController
    def index
      # @videos = Video.includes(:categories).displayed.group_by(&:categories)
      @categories = Category.includes(:videos).group_by(&:name)
      # raise @categories.to_yaml
      @additional_content = AdditionalContent.displayed.find_by(area: 'videos')
    end
  end
end
