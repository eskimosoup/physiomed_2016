module Optimadmin
  class CategoriesGuidePresenter
    include Optimadmin::PresenterMethods

    presents :categories_guide
    delegate :id, to: :categories_guide

    def title
      categories_guide.guide.title
    end
  end
end
