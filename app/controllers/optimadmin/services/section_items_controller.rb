# frozen_string_literal: true

module Optimadmin
  module Services
    class SectionItemsController < Optimadmin::ApplicationController
      before_action :set_services_section
      before_action :set_services_section_item, only: %i[show edit update destroy]

      edit_images_for ::Services::SectionItem,
                      [
                        [:image, ::Services::SectionItemUploader::CROPS]
                      ]

      def index
        @services_section_items = @section.items.field_order(params[:order])
                                                         .field_search(params[:search])
                                                         .pagination(params[:page], params[:per_page])
            end

      def show; end

      def new
        @services_section_item = @section.items.new
      end

      def edit; end

      def create
        @services_section_item = @section.items.new(services_section_item_params)
        if @services_section_item.save
          redirect_to_index_or_continue_editing(@services_section_item)
        else
          render :new
        end
      end

      def update
        if @services_section_item.update(services_section_item_params)
          redirect_to_index_or_continue_editing(@services_section_item)
        else
          render :edit
        end
      end

      def destroy
        @services_section_item.destroy
        if @services_section_item.errors.present?
          redirect_to :back, flash: { error: @services_section_item.errors.messages[:base].first }
        else
          redirect_to :back, notice: t('optimadmin.controllers.module.destroy', model_name: ::Services::SectionItem.model_name.human)
        end
      end

      private

      def set_services_section
        @section = ::Services::Section.find(params[:section_id])
      end

      def set_services_section_item
        @services_section_item = @section.items.find(params[:id])
      end

      def services_section_item_params
        params.require(:services_section_item).permit(
          :services_section_id, :position, :title, :content, :image, :style,
          :display, :remove_image, :remote_image_url, :image_cache,
          :subtitle
        )
      end
    end
  end
end
