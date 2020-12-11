module Optimadmin
  module LandingPages
    class SectionsController < Optimadmin::ApplicationController
      before_action :find_landing_page
      before_action :set_landing_page_section, only: %i[show edit update destroy]
      edit_images_for ::LandingPages::Section,
                      [
                        [:image, { show: ['fill', 300, 300] }]
                      ]

      def index
        @landing_page_sections = @landing_page.sections.order(position: :asc)
      end

      def show; end

      def new
        @landing_page_section = @landing_page.sections.new
      end

      def edit; end

      def create
        @landing_page_section = @landing_page.sections.new(landing_page_section_params)
        if @landing_page_section.save
          redirect_to(
            landing_page_sections_path(@landing_page),
            notice: 'Landing page section was successfully created.'
          )
        else
          render :new
        end
      end

      def update
        if @landing_page_section.update(landing_page_section_params)
          redirect_to(
            landing_page_sections_path(@landing_page),
            notice: 'Landing page section was successfully updated.'
          )
        else
          render :edit
        end
      end

      def destroy
        @landing_page_section.destroy
        redirect_to(
          landing_page_sections_path(@landing_page),
          notice: 'Landing page section was successfully destroyed.'
        )
      end

      private

      def find_landing_page
        @landing_page = LandingPage.friendly.find(params[:landing_page_id])
      end

      def set_landing_page_section
        @landing_page_section = ::LandingPages::Section.find(params[:id])
      end

      def landing_page_section_params
        params.require(:landing_pages_section)
              .permit(
                :landing_page_id,
                :title,
                :sub_title,
                :content,
                :image,
                :style,
                :button_link,
                :button_text
              )
      end
    end
  end
end
