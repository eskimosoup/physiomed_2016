module Optimadmin
  class PartnersController < Optimadmin::ApplicationController
    before_action :set_partner, only: [:show, :edit, :update, :destroy]

    edit_images_for Partner,
                    [
                      [:image, PartnerUploader::CROPS]
                    ]

    def index
              @partners = Partner.field_order(params[:order])
                                              .field_search(params[:search])
                                              .pagination(params[:page], params[:per_page])
          end

    def show
    end

    def new
      @partner = Partner.new
    end

    def edit
    end

    def create
      @partner = Partner.new(partner_params)
      if @partner.save
        redirect_to_index_or_continue_editing(@partner)
      else
        render :new
      end
    end

    def update
      if @partner.update(partner_params)
        redirect_to_index_or_continue_editing(@partner)
      else
        render :edit
      end
    end

    def destroy
      @partner.destroy
      if @partner.errors.present?
        redirect_back(fallback_location: { action: :index }, flash: { error: @partner.errors.messages[:base].first })
      else
        redirect_back(fallback_location: { action: :index }, notice: t('optimadmin.controllers.module.destroy', model_name: Partner.model_name.human))
      end
    end

    private

    def set_partner
      @partner = Partner.find(params[:id])
    end

    def partner_params
      params.require(:partner).permit(
        :position, :title, :summary, :content, :image, :website_url, :display, :remove_image, :remote_image_url, :image_cache
      )
    end
  end
end
