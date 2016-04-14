module Optimadmin
  class BannersController < Optimadmin::ApplicationController
    edit_images_for Banner, [[:image, { show: ['fit', 1200, 9999] } ]]
    before_action :set_banner, only: [:show, :edit, :update, :destroy]

    def index
      @banners = Banner.order(:position)
    end

    def show
    end

    def new
      @banner = Banner.new
    end

    def edit
    end

    def create
      @banner = Banner.new(banner_params)
      if @banner.save
        redirect_to_index_or_continue_editing(@banner)
      else
        render :new
      end
    end

    def update
      if @banner.update(banner_params)
        redirect_to_index_or_continue_editing(@banner)
      else
        render :edit
      end
    end

    def destroy
      @banner.destroy
      redirect_to banners_url, notice: 'Banner was successfully destroyed.'
    end

    private

    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params.require(:banner)
            .permit(:title, :image, :image_cache, :remote_image_url, :position, :display, :summary, :link)
    end
  end
end
