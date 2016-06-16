module Optimadmin
  class TestimonialsController < Optimadmin::ApplicationController
    before_action :set_testimonial, only: [:show, :edit, :update, :destroy]

    def index
      @testimonials = Testimonial.order_by(params[:order])
        .search(params[:search]).page(params[:page]).per(10)
    end

    def show
    end

    def new
      @testimonial = Testimonial.new
    end

    def edit
    end

    def create
      @testimonial = Testimonial.new(testimonial_params)
      if @testimonial.save
        redirect_to_index_or_continue_editing(@testimonial)
      else
        render :new
      end
    end

    def update
      if @testimonial.update(testimonial_params)
        redirect_to_index_or_continue_editing(@testimonial)
      else
        render :edit
      end
    end

    def destroy
      @testimonial.destroy
      redirect_to testimonials_url, notice: 'Testimonial was successfully destroyed.'
    end

    private

    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end

    def testimonial_params
      params.require(:testimonial)
            .permit(:title, :author, :content, :role, :case_study_id,
              :display, category_ids: [])
    end
  end
end
