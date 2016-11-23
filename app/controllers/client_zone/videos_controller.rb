module ClientZone
  class VideosController < BaseController
    def index
      @videos = Video.displayed
      @additional_content = AdditionalContent.displayed.find_by(area: 'videos')
    end

    def show
      @video = Video.displayed.find(params[:id])
    end
  end
end
