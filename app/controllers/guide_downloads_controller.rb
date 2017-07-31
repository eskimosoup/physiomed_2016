class GuideDownloadsController < ApplicationController
  before_action :find_guide

  layout 'colorbox'

  def new
    @download = @guide.downloads.new
  end

  def create
    @download = @guide.downloads.new(guide_download_params)
    respond_to do |format|
      format.js do
        @guide_url = @guide.file.url if @download.save
        render :new
      end
    end
  end

  private

  def guide_download_params
    params.require(:guide_download).permit(
      :name, :job_title, :phone, :email
    )
  end

  def find_guide
    @guide = Guide.displayed.find(params[:guide_id])
  end
end
