module Optimadmin
  class BodyPartsController < Optimadmin::ApplicationController
    before_action :set_body_part, only: [:show, :edit, :update, :destroy]

    def index
      @body_parts = BodyPart.order(position: :asc)
    end

    def show
    end

    def new
      @body_part = BodyPart.new
    end

    def edit
    end

    def create
      @body_part = BodyPart.new(body_part_params)
      if @body_part.save
        redirect_to_index_or_continue_editing(@body_part)
      else
        render :new
      end
    end

    def update
      if @body_part.update(body_part_params)
        redirect_to_index_or_continue_editing(@body_part)
      else
        render :edit
      end
    end

    def destroy
      @body_part.destroy
      redirect_to body_parts_url, notice: 'Body part was successfully destroyed.'
    end

    private

    def set_body_part
      @body_part = BodyPart.friendly.find(params[:id])
    end

    def body_part_params
      params.require(:body_part)
            .permit(:category_id, :summary, :image, :tagline, :display, 
                    :remove_image, :remote_image_url, :image_cache)
    end
  end
end
