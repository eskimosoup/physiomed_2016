module Optimadmin
  class BodyPartSectionsController < Optimadmin::ApplicationController
    before_action :set_body_part_section, only: [:show, :edit, :update, :destroy]
    edit_images_for BodyPartSection, [
      [:image, { wellbeing_index: ['fill', 389, 142], show: ['fill', 300, 300] }]
    ]

    def index
      @body_part = find_body_part
      @body_part_sections = @body_part.body_part_sections.order(position: :asc)
    end

    def show
    end

    def new
      @body_part = find_body_part
      @body_part_section = @body_part.body_part_sections.new
    end

    def edit
    end

    def create
      @body_part = find_body_part
      @body_part_section = @body_part.body_part_sections.new(body_part_section_params)
      if @body_part_section.save
        redirect_to body_part_body_part_sections_url(@body_part),
          notice: 'Body part section was successfully created.'
      else
        render :new
      end
    end

    def update
      if @body_part_section.update(body_part_section_params)
        redirect_to body_part_body_part_sections_url(@body_part_section.body_part_id), notice: 'Body part section was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @body_part_section.destroy
      redirect_to body_part_body_part_sections_url(@body_part_section.body_part_id), notice: 'Body part section was successfully destroyed.'
    end

    private

    def find_body_part
      BodyPart.friendly.find(params[:body_part_id])
    end

    def set_body_part_section
      @body_part_section = BodyPartSection.find(params[:id])
    end

    def body_part_section_params
      params.require(:body_part_section)
            .permit(:body_part_id, :title, :sub_title, :content, :image)
    end
  end
end
