module Optimadmin
  module ClientZone
    class ServicesController < Optimadmin::ApplicationController
      before_action :set_client_zone_service, only: [:show, :edit, :update, :destroy]
      edit_images_for ::ClientZone::Service, [
        [:image, { show: ['fill', 300, 300] }]
      ]

      def index
        @pagination_helper = ::ClientZone::Service.field_order(params[:order])
                                                  .field_search(params[:search])
                                                  .pagination(params[:page], params[:per_page])

        @client_zone_services = Optimadmin::BaseCollectionPresenter.new(
          collection: @pagination_helper,
          view_template: view_context,
          presenter: Optimadmin::ClientZone::ServicePresenter)
      end

      def show
      end

      def new
        @client_zone_service = ::ClientZone::Service.new
      end

      def edit
      end

      def create
        @client_zone_service = ::ClientZone::Service.new(client_zone_service_params)
        if @client_zone_service.save
          redirect_to_index_or_continue_editing(@client_zone_service)
        else
          render :new
        end
      end

      def update
        if @client_zone_service.update(client_zone_service_params)
          redirect_to_index_or_continue_editing(@client_zone_service)
        else
          render :edit
        end
      end

      def destroy
        @client_zone_service.destroy
        redirect_to client_zone_services_url, notice: 'Service was successfully destroyed.'
      end

      private

      def set_client_zone_service
        @client_zone_service = ::ClientZone::Service.find(params[:id])
      end

      def client_zone_service_params
        params.require(:client_zone_service)
              .permit(
                :title, :summary, :file, :image, :display, :position,
                :remote_image_url, :image_cache, :remove_image,
                :remote_file_url, :file_cache, :remove_file
              )
      end
    end
  end
end
