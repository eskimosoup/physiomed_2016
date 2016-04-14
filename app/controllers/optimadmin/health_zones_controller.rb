module Optimadmin
  class HealthZonesController < Optimadmin::ApplicationController
    edit_images_for HealthZone, [
      [:image, { show: ['fill', 480, 300] }],
      [:home_image, { show: ['fill', 335, 140] }]
    ]
    before_action :set_health_zone, only: [:show, :edit, :update, :destroy]

    def index
      @health_zones = HealthZone.ordered_by_position
    end

    def show
    end

    def new
      @health_zone = HealthZone.new
    end

    def edit
    end

    def create
      @health_zone = HealthZone.new(health_zone_params)
      if @health_zone.save
        redirect_to_index_or_continue_editing(@health_zone)
      else
        render :new
      end
    end

    def update
      if @health_zone.update(health_zone_params)
        redirect_to_index_or_continue_editing(@health_zone)
      else
        render :edit
      end
    end

    def destroy
      @health_zone.destroy
      redirect_to health_zones_url, notice: 'Health zone was successfully destroyed.'
    end

    private

    def set_health_zone
      @health_zone = HealthZone.find(params[:id])
    end

    def health_zone_params
      params.require(:health_zone)
            .permit(:title, :image, :home_image, :hover_text, :link, :display, :content, :remove_image, :remote_image_url, :image_cache, :remote_home_image_url, :home_image_cache)
    end
  end
end
