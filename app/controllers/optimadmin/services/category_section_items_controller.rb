module Optimadmin
  class Services::CategorySectionItemsController < Optimadmin::ApplicationController
    before_action :set_services_category_section
    before_action :set_services_category_section_item, only: [:show, :edit, :update, :destroy]

    edit_images_for ::Services::CategorySectionItem,
                    [
                      [:image, ::Services::SectionUploader::CROPS]
                    ]


    def index
              @services_category_section_items = @services_category_section.items.field_order(params[:order])
                                              .field_search(params[:search])
                                              .pagination(params[:page], params[:per_page])
          end

    def show
    end

    def new
      @services_category_section_item = @services_category_section.items.new
    end

    def edit
    end

    def create
      @services_category_section_item = @services_category_section.items.new(services_category_section_item_params)
      if @services_category_section_item.save
        redirect_to_index_or_continue_editing(@services_category_section_item)
      else
        render :new
      end
    end

    def update
      if @services_category_section_item.update(services_category_section_item_params)
        redirect_to_index_or_continue_editing(@services_category_section_item)
      else
        render :edit
      end
    end

    def destroy
      @services_category_section_item.destroy
      if @services_category_section_item.errors.present?
        redirect_back(fallback_location: { action: :index }, flash: { error: @services_category_section_item.errors.messages[:base].first })
      else
        redirect_back(fallback_location: { action: :index }, notice: t('optimadmin.controllers.module.destroy', model_name: ::Services::CategorySectionItem.model_name.human))
      end
    end

    private

        def redirect_back(fallback_location: { action: :index }, flash: nil, notice: nil)
      redirect_to fallback_location, notice: (flash.present? ? flash[:error] : notice)
    end

    def set_services_category_section
      @services_category_section = ::Services::CategorySection.find(params[:section_id])
    end

    def set_services_category_section_item
      @services_category_section_item = @services_category_section.items.find(params[:id])
    end

    def services_category_section_item_params
      params.require(:services_category_section_item).permit(
        :title, :content, :image, :style, :subtitle,
        :display, :subtitle, :button_text, :button_link,
        :remove_image, :remote_image_url, :image_cache,
      )
    end
  end
end
