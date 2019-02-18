module Optimadmin
  class Services::CategoriesController < Optimadmin::ApplicationController
    before_action :set_services_category, only: [:show, :edit, :update, :destroy]


    def index
              @services_categories = ::Services::Category.field_order(params[:order])
                                              .field_search(params[:search])
                                              .pagination(params[:page], params[:per_page])
          end

    def show
    end

    def new
      @services_category = ::Services::Category.new
    end

    def edit
    end

    def create
      @services_category = ::Services::Category.new(services_category_params)
      if @services_category.save
        redirect_to_index_or_continue_editing(@services_category)
      else
        render :new
      end
    end

    def update
      if @services_category.update(services_category_params)
        redirect_to_index_or_continue_editing(@services_category)
      else
        render :edit
      end
    end

    def destroy
      @services_category.destroy
      if @services_category.errors.present?
        redirect_back(fallback_location: { action: :index }, flash: { error: @services_category.errors.messages[:base].first })
      else
        redirect_back(fallback_location: { action: :index }, notice: t('optimadmin.controllers.module.destroy', model_name: ::Services::Category.model_name.human))
      end
    end

    private

    def redirect_back(fallback_location: { action: :index }, flash: nil, notice: nil)
      redirect_to fallback_location, notice: (flash.present? ? flash[:error] : notice)
    end

    def set_services_category
      @services_category = ::Services::Category.friendly.find(params[:id])
    end

    def services_category_params
      params.require(:services_category).permit(
        :position, :parent_id, :colour, :title, :summary, :content, :display,
        :style, :homepage_highlight, :show_children
      )
    end
  end
end
