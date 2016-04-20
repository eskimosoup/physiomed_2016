module Optimadmin
  class TestimonialPresenter
    include Optimadmin::PresenterMethods

    presents :testimonial
    delegate :id, :title, to: :testimonial

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format testimonial.summary
    end
  end
end
