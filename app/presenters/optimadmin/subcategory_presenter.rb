module Optimadmin
  class SubcategoryPresenter
    include Optimadmin::PresenterMethods

    presents :subcategory
    delegate :id, :title, to: :subcategory

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format subcategory.summary
    end
  end
end
