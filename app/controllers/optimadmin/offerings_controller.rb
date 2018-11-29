module Optimadmin
  class OfferingsController < Optimadmin::ApplicationController
    before_action :set_offering, only: [:show, :edit, :update, :destroy]


    def index
              @offerings = ::Offering.field_order(params[:order])
                                              .field_search(params[:search])
                                              .pagination(params[:page], params[:per_page])
          end

    def show
    end

    def new
      @offering = ::Offering.new
    end

    def edit
    end

    def create
      @offering = ::Offering.new(offering_params)
      if @offering.save
        redirect_to_index_or_continue_editing(@offering)
      else
        render :new
      end
    end

    def update
      if @offering.update(offering_params)
        redirect_to_index_or_continue_editing(@offering)
      else
        render :edit
      end
    end

    def destroy
      @offering.destroy
      if @offering.errors.present?
        redirect_back(fallback_location: { action: :index }, flash: { error: @offering.errors.messages[:base].first })
      else
        redirect_back(fallback_location: { action: :index }, notice: t('optimadmin.controllers.module.destroy', model_name: ::Offering.model_name.human))
      end
    end

    private

        def redirect_back(fallback_location: { action: :index }, flash: nil, notice: nil)
      redirect_to fallback_location, notice: (flash.present? ? flash[:error] : notice)
    end
    
    def set_offering
      @offering = ::Offering.find(params[:id])
    end

    def offering_params
      params.require(:offering).permit(
        :position, :title, :link, :display
      )
    end
  end
end
