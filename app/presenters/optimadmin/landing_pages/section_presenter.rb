module Optimadmin
  module LandingPages
    class SectionPresenter
      include Optimadmin::PresenterMethods

      presents :section
      delegate :id, :title, to: :section

      def style
        section.style.humanize
      end

      def toggle_title
        inline_detail_toggle_link(title)
      end

      def optimadmin_summary
        # h.simple_format body_part_section.summary
      end

      def edit_link
        h.link_to pencil, h.edit_landing_page_section_path(section.landing_page, section), class: 'menu-item-control'
      end

      def delete_link
        h.link_to trash_can, h.landing_page_section_path(section.landing_page, section), method: :delete, data: { confirm: 'Are you sure?' }, class: 'menu-item-control'
      end
    end
  end
end
