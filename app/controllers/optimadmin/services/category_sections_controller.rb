# frozen_string_literal: true

module Optimadmin
  class Services::CategorySectionsController < Optimadmin::ApplicationController
    before_action :set_services_category
    before_action :set_services_category_section, only: %i[show edit update destroy]

    edit_images_for ::Services::CategorySection,
                    [
                      [:image, ::Services::CategorySectionUploader::CROPS]
                    ]

    def index
      @services_category_sections = @services_category.sections.field_order(params[:order])
                                                               .field_search(params[:search])
                                                               .pagination(params[:page], params[:per_page])
          end

    def show; end

    def new
      @services_category_section = @services_category.sections.new
    end

    def edit; end

    def create
      @services_category_section = @services_category.sections.new(services_category_section_params)
      if @services_category_section.save
        redirect_to_index_or_continue_editing(@services_category_section)
      else
        render :new
      end
    end

    def update
      if @services_category_section.update(services_category_section_params)
        redirect_to_index_or_continue_editing(@services_category_section)
      else
        render :edit
      end
    end

    def destroy
      @services_category_section.destroy
      if @services_category_section.errors.present?
        redirect_back(fallback_location: { action: :index }, flash: { error: @services_category_section.errors.messages[:base].first })
      else
        redirect_back(fallback_location: { action: :index }, notice: t('optimadmin.controllers.module.destroy', model_name: ::Services::CategorySection.model_name.human))
      end
    end

    private

    def redirect_back(fallback_location: { action: :index }, flash: nil, notice: nil)
      redirect_to fallback_location, notice: (flash.present? ? flash[:error] : notice)
end

    def set_services_category
      @services_category = ::Services::Category.friendly.find(params[:service_category_id])
    end

    def set_services_category_section
      @services_category_section = @services_category.sections.find(params[:id])
    end

    def services_category_section_params
      params.require(:services_category_section).permit(
        :position, :title, :content, :image, :display,
        :remove_image, :remote_image_url, :image_cache,
        :style, :button_link, :button_text
      )
    end
  end
end
