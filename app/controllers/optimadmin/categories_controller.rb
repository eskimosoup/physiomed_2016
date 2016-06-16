module Optimadmin
  class CategoriesController < Optimadmin::ApplicationController
    before_action :set_category, only: [:edit, :update, :destroy]

    def index
      @categories = Category.order(name: :asc)
    end

    def new
      @category = Category.new
    end

    def edit
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to_index_or_continue_editing(@category)
      else
        render :new
      end
    end

    def update
      if @category.update(category_params)
        redirect_to_index_or_continue_editing(@category)
      else
        render :edit
      end
    end

    def destroy
      @category.destroy
      redirect_to categories_url, notice: 'Category was successfully destroyed.'
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category)
            .permit(:name, article_ids: [], case_study_ids: [], guide_ids: [],
                   testimonial_ids: [], video_ids: [])
    end
  end
end
