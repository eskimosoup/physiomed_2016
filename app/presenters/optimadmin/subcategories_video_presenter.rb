module Optimadmin
  class SubcategoriesVideoPresenter
    include Optimadmin::PresenterMethods

    presents :subcategories_video
    delegate :id, to: :subcategories_video

    def title
      [subcategories_video.video.title, subcategories_video.video.guide.title].compact.join(' - ')
    end
  end
end
