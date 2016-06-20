class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.displayed.order(created_at: :desc)
  end
end
