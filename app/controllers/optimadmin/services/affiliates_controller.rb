module Optimadmin
  class Services::AffiliatesController < Optimadmin::ApplicationController
    before_action :set_services_affiliate, only: [:show, :edit, :update, :destroy]

    edit_images_for ::Services::Affiliate,
                    [
                      [:image, ::Services::AffiliateUploader::CROPS], 
                      [:icon, ::Services::AffiliateUploader::CROPS]
                    ]

    def index
              @services_affiliates = ::Services::Affiliate.field_order(params[:order])
                                              .field_search(params[:search])
                                              .pagination(params[:page], params[:per_page])
          end

    def show
    end

    def new
      @services_affiliate = ::Services::Affiliate.new
    end

    def edit
    end

    def create
      @services_affiliate = ::Services::Affiliate.new(services_affiliate_params)
      if @services_affiliate.save
        redirect_to_index_or_continue_editing(@services_affiliate)
      else
        render :new
      end
    end

    def update
      if @services_affiliate.update(services_affiliate_params)
        redirect_to_index_or_continue_editing(@services_affiliate)
      else
        render :edit
      end
    end

    def destroy
      @services_affiliate.destroy
      if @services_affiliate.errors.present?
        redirect_back(fallback_location: { action: :index }, flash: { error: @services_affiliate.errors.messages[:base].first })
      else
        redirect_back(fallback_location: { action: :index }, notice: t('optimadmin.controllers.module.destroy', model_name: ::Services::Affiliate.model_name.human))
      end
    end

    private

        def redirect_back(fallback_location: { action: :index }, flash: nil, notice: nil)
      redirect_to fallback_location, notice: (flash.present? ? flash[:error] : notice)
    end
    
    def set_services_affiliate
      @services_affiliate = ::Services::Affiliate.find(params[:id])
    end

    def services_affiliate_params
      params.require(:services_affiliate).permit(
        :position, :title, :content, :image, :icon, :display, :subtitle, :button_text, :button_link, :remove_image, :remote_image_url, :image_cache, :remove_icon, :remote_icon_url, :icon_cache
      )
    end
  end
end
