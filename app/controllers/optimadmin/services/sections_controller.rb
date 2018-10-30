# frozen_string_literal: true

module Optimadmin
  module Services
    class SectionsController < Optimadmin::ApplicationController
      before_action :set_service
      before_action :set_services_section, only: %i[show edit update destroy]

      edit_images_for ::Services::Section,
                      [
                        [:image, ::Services::SectionUploader::CROPS]
                      ]

      def index
        @services_sections = @service.sections.field_order(params[:order])
                                                .field_search(params[:search])
                                                .pagination(params[:page], params[:per_page])
      end

      def show; end

      def new
        @services_section = @service.sections.new
      end

      def edit; end

      def create
        @services_section = @service.sections.new(services_section_params)
        if @services_section.save
          redirect_to_index_or_continue_editing(@services_section)
        else
          render :new
        end
      end

      def update
        if @services_section.update(services_section_params)
          redirect_to_index_or_continue_editing(@services_section)
        else
          render :edit
        end
      end

      def destroy
        @services_section.destroy
        if @services_section.errors.present?
          redirect_to :back, flash: { error: @services_section.errors.messages[:base].first }
        else
          redirect_to :back, notice: t('optimadmin.controllers.module.destroy', model_name: ::Services::Section.model_name.human)
        end
      end

      private

      def set_service
        @service = ::Service.friendly.find(params[:service_id])
      end

      def set_services_section
        @services_section = @service.sections.find(params[:id])
      end

      def services_section_params
        params.require(:services_section).permit(
          :service_id, :position, :title, :content, :image, :style, :display,
          :section_items, :remove_image, :remote_image_url, :image_cache,
          :subtitle
        )
      end
    end
  end
end
