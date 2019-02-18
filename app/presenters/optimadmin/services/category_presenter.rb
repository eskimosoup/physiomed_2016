# frozen_string_literal: true

module Optimadmin
  class Services::CategoryPresenter
    include Optimadmin::PresenterMethods

    presents :services_category
    delegate :id, :title, to: :services_category

    def title_with_hierarchy
      services_category.ancestry_path.reverse.join(': ')
    end

    def manage_sections
      h.link_to 'Manage sections', h.service_category_sections_path(services_category)
    end
  end
end
