module Optimadmin
  class LandingPagesController < Optimadmin::ApplicationController
    before_action :set_landing_page, only: [:show, :edit, :update, :destroy]
    edit_images_for LandingPage, [
      [:image, { background: ['fit', 1920, 400] }, home: ['fill', 285, 205]]
    ]

    def index
              @landing_pages = LandingPage.field_order(params[:order])
                                              .field_search(params[:search])
                                              .pagination(params[:page], params[:per_page])
          end

    def show
    end

    def new
      @landing_page = LandingPage.new
    end

    def edit
    end

    def create
      @landing_page = LandingPage.new(landing_page_params)
      if @landing_page.save
        redirect_to_index_or_continue_editing(@landing_page)
      else
        render :new
      end
    end

    def update
      if @landing_page.update(landing_page_params)
        redirect_to_index_or_continue_editing(@landing_page)
      else
        render :edit
      end
    end

    def destroy
      @landing_page.destroy
      redirect_to landing_pages_url, notice: 'Landing page was successfully destroyed.'
    end

    private

    def set_landing_page
      @landing_page = LandingPage.friendly.find(params[:id])
    end

    def landing_page_params
      params.require(:landing_page).permit(
        :title, :content, :style, :layout, :display, :suggested_url,
        :image, :remote_image_url, :image_cache, :remove_image,
        article_ids: [], case_study_ids: [], frequently_asked_question_ids: [],
        guide_ids: [], testimonial_ids: [], video_ids: [], service_standard_ids: []
      )
    end
  end
end
