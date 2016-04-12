module Optimadmin
  class BodyPartsController < Optimadmin::ApplicationController

    def index
      @body_parts = BodyPart.order(name: :asc)
    end

    def show
      @body_part = find_body_part
    end

    def new
      @body_part = BodyPart.new
    end

    def edit
      @body_part = find_body_part
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
      @body_part = find_body_part
      if @body_part.update(body_part_params)
        redirect_to_index_or_continue_editing(@body_part)
      else
        render :edit
      end
    end

    def destroy
      @body_part = find_body_part
      @body_part.destroy
      redirect_to body_parts_url, notice: 'Body part was successfully destroyed.'
    end

    private

    def find_body_part
      BodyPart.friendly.find(params[:id])
    end

    def body_part_params
      params.require(:body_part)
            .permit(:name, :introduction, :display)
    end
  end
end
