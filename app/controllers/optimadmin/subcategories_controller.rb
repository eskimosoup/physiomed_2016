module Optimadmin
  class SubcategoriesController < Optimadmin::ApplicationController
    before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

    edit_images_for Subcategory, [
      [:image, { index: ['fill', 300, 300] }]
    ]

    def index
      @pagination_helper = Subcategory.field_order(params[:order])
                                      .field_search(params[:search])
                                      .pagination(params[:page], params[:per_page])

      @subcategories = Optimadmin::BaseCollectionPresenter.new(
        collection: @pagination_helper,
        view_template: view_context,
        presenter: Optimadmin::SubcategoryPresenter)
    end

    def show
    end

    def new
      @subcategory = Subcategory.new
    end

    def edit
    end

    def create
      @subcategory = Subcategory.new(subcategory_params)
      if @subcategory.save
        redirect_to_index_or_continue_editing(@subcategory)
      else
        render :new
      end
    end

    def update
      if @subcategory.update(subcategory_params)
        redirect_to_index_or_continue_editing(@subcategory)
      else
        render :edit
      end
    end

    def destroy
      @subcategory.destroy
      redirect_to subcategories_url, notice: 'Subcategory was successfully destroyed.'
    end

    private

    def set_subcategory
      @subcategory = Subcategory.friendly.find(params[:id])
    end

    def subcategory_params
      params.require(:subcategory)
            .permit(:title, :image, :summary, :display, :remove_image,
                    :remote_image_url, :image_cache, :suggested_url,
                    video_ids: [])
    end
  end
end
