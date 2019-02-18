module Optimadmin
  class Services::CategorySectionItemPresenter
    include Optimadmin::PresenterMethods

    presents :services_category_section_item
    delegate :id, :title, to: :services_category_section_item
  end
end
