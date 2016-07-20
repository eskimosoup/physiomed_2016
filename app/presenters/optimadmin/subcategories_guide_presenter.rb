module Optimadmin
  class SubcategoriesGuidePresenter
    include Optimadmin::PresenterMethods

    presents :subcategories_guide
    delegate :id, to: :subcategories_guide

    def title
      subcategories_guide.guide.title
    end
  end
end
