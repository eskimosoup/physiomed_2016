class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.displayed.order_by(created_at: :desc)
  end
end
