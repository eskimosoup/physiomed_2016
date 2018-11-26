# frozen_string_literal: true

module Optimadmin
  class Policies::CategoriesController < Optimadmin::ApplicationController
    before_action :set_policies_category, only: %i[show edit update destroy]

    def index
      @policies_categories = ::Policies::Category.field_order(params[:order])
                                                 .field_search(params[:search])
                                                 .pagination(params[:page], params[:per_page])
    end

    def show; end

    def new
      @policies_category = ::Policies::Category.new
    end

    def edit; end

    def create
      @policies_category = ::Policies::Category.new(policies_category_params)
      if @policies_category.save
        redirect_to_index_or_continue_editing(@policies_category)
      else
        render :new
      end
    end

    def update
      if @policies_category.update(policies_category_params)
        redirect_to_index_or_continue_editing(@policies_category)
      else
        render :edit
      end
    end

    def destroy
      @policies_category.destroy
      if @policies_document.errors.present?
        redirect_to :back, flash: { error: @policies_document.errors.messages[:base].first }
      else
        redirect_to :back, notice: t('optimadmin.controllers.module.destroy', model_name: ::Policies::Category.model_name.human)
      end
    end

    private

    def set_policies_category
      @policies_category = ::Policies::Category.friendly.find(params[:id])
    end

    def policies_category_params
      params.require(:policies_category).permit(
        :position, :title, :documents_count, :display, :suggested_url
      )
    end
  end
end
