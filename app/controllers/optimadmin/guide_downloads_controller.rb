module Optimadmin
  class GuideDownloadsController < Optimadmin::ApplicationController
    before_action :set_guide_download, only: :show

    def index
              @guide_downloads = GuideDownload.pagination(params[:page], params[:per_page])
          end

    def show
    end

    private

    def set_guide_download
      @guide_download = GuideDownload.find(params[:id])
    end
  end
end
