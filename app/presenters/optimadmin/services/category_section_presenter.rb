# frozen_string_literal: true

module Optimadmin
  class Services::CategorySectionPresenter
    include Optimadmin::PresenterMethods

    presents :services_category_section
    delegate :id, :title, to: :services_category_section

    def manage_section_items
      h.link_to 'Manage section items', h.service_category_section_items_path(services_category_section.category, services_category_section)
    end
  end
end
