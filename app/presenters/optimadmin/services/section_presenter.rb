# frozen_string_literal: true

module Optimadmin
  module Services
    class SectionPresenter
      include Optimadmin::PresenterMethods

      presents :services_section
      delegate :id, :title, :section_items_count, to: :services_section

      def manage_section_items
        h.link_to "Manage #{h.pluralize(section_items_count, ::Services::SectionItem.model_name.human, ::Services::SectionItem.model_name.human.pluralize)}", h.section_items_path(services_section)
      end

      def edit_link
        h.link_to pencil, h.edit_service_section_path(services_section.service, services_section), class: 'menu-item-control'
      end

      def delete_link
        h.link_to trash_can, h.service_section_path(services_section.service, services_section), class: 'menu-item-control', method: :delete, data: { confirm: 'Are you sure?' }
      end
    end
  end
end
