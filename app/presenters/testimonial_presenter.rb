class TestimonialPresenter < BasePresenter
  presents :testimonial
  delegate :id, to: :testimonial
end
