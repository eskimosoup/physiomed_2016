module Optimadmin
  class CategoriesTestimonialPresenter
    include Optimadmin::PresenterMethods

    presents :categories_testimonial
    delegate :id, to: :categories_testimonial

    def title
      categories_testimonial.testimonial.title
    end
  end
end
