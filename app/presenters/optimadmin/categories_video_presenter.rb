module Optimadmin
  class CategoriesVideoPresenter
    include Optimadmin::PresenterMethods

    presents :categories_video
    delegate :id, to: :categories_video

    def title
      categories_video.video.title
    end
  end
end
