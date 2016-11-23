module Optimadmin
  module ClientZone
    class AdditionalContentPresenter
      include Optimadmin::PresenterMethods

      presents :client_zone_additional_content
      delegate :id, :title, :area, to: :client_zone_additional_content

      def toggle_title
        inline_detail_toggle_link(title)
      end

      def humanised_area
        area.humanize
      end
    end
  end
end
