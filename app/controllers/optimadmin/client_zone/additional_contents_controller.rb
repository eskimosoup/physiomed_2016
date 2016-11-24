module Optimadmin
  module ClientZone
    class AdditionalContentsController < Optimadmin::ApplicationController
      before_action :set_client_zone_additional_content, only: [:show, :edit, :update, :destroy]

      def index
        @pagination_helper = ::ClientZone::AdditionalContent.field_order(params[:order])
                                                            .field_search(params[:search])
                                                            .pagination(params[:page], params[:per_page])

        @client_zone_additional_contents = Optimadmin::BaseCollectionPresenter.new(
          collection: @pagination_helper,
          view_template: view_context,
          presenter: Optimadmin::ClientZone::AdditionalContentPresenter
        )
      end

      def show
      end

      def new
        @client_zone_additional_content = ::ClientZone::AdditionalContent.new
      end

      def edit
      end

      def create
        @client_zone_additional_content = ::ClientZone::AdditionalContent.new(client_zone_additional_content_params)
        if @client_zone_additional_content.save
          redirect_to_index_or_continue_editing(@client_zone_additional_content)
        else
          render :new
        end
      end

      def update
        if @client_zone_additional_content.update(client_zone_additional_content_params)
          redirect_to_index_or_continue_editing(@client_zone_additional_content)
        else
          render :edit
        end
      end

      def destroy
        @client_zone_additional_content.destroy
        redirect_to client_zone_additional_contents_url, notice: 'Additional content was successfully destroyed.'
      end

      private

      def set_client_zone_additional_content
        @client_zone_additional_content = ::ClientZone::AdditionalContent.find(params[:id])
      end

      def client_zone_additional_content_params
        params.require(:client_zone_additional_content)
              .permit(:area, :title, :content, :display)
      end
    end
  end
end
