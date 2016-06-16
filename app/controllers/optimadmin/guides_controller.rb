module Optimadmin
  class GuidesController < Optimadmin::ApplicationController
    before_action :set_guide, only: [:show, :edit, :update, :destroy]

    def index
      @guides = Guide.order(title: :asc).page(params[:page]).per(params[:per_page])
    end

    def show
    end

    def new
      @guide = Guide.new
    end

    def edit
    end

    def create
      @guide = Guide.new(guide_params)
      if @guide.save
        redirect_to_index_or_continue_editing(@guide)
      else
        render :new
      end
    end

    def update
      if @guide.update(guide_params)
        redirect_to_index_or_continue_editing(@guide)
      else
        render :edit
      end
    end

    def destroy
      @guide.destroy
      redirect_to guides_url, notice: 'Guide was successfully destroyed.'
    end

    private

    def set_guide
      @guide = Guide.find(params[:id])
    end

    def guide_params
      params.require(:guide)
            .permit(:title, :content, :file, :image, :display, :remove_image, :remote_image_url, :image_cache)
    end
  end
end
