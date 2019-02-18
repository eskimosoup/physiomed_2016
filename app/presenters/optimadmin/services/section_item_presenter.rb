# frozen_string_literal: true

module Optimadmin
  module Services
    class SectionItemPresenter
      include Optimadmin::PresenterMethods

      presents :services_section_item
      delegate :id, :title, to: :services_section_item

      def manage_section_items
        h.link_to "Manage #{h.pluralize(section_items_count, ::Services::SectionItem.model_name.human, ::Services::SectionItem.model_name.human.pluralize)}", h.section_items_path(services_section)
      end

      def edit_link
        h.link_to pencil, h.edit_section_item_path(services_section_item.section, services_section_item), class: 'menu-item-control'
      end

      def delete_link
        h.link_to trash_can, h.section_item_path(services_section_item.section, services_section_item), class: 'menu-item-control', method: :delete, data: { confirm: 'Are you sure?' }
      end
    end
  end
end
