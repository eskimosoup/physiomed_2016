module Optimadmin
  class ServiceStandardsController < Optimadmin::ApplicationController
    before_action :set_service_standard, only: [:show, :edit, :update, :destroy]

    def index
      @service_standards = ServiceStandard.ordered_by_position 
    end

    def show
    end

    def new
      @service_standard = ServiceStandard.new
    end

    def edit
    end

    def create
      @service_standard = ServiceStandard.new(service_standard_params)
      if @service_standard.save
        redirect_to_index_or_continue_editing(@service_standard)
      else
        render :new
      end
    end

    def update
      if @service_standard.update(service_standard_params)
        redirect_to_index_or_continue_editing(@service_standard)
      else
        render :edit
      end
    end

    def destroy
      @service_standard.destroy
      redirect_to service_standards_url, notice: 'Service standard was successfully destroyed.'
    end

    private

    def set_service_standard
      @service_standard = ServiceStandard.find(params[:id])
    end

    def service_standard_params
      params.require(:service_standard)
            .permit(:icon, :content, :hover_content, :position, :display)
    end
  end
end
