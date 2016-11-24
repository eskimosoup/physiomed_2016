module Optimadmin
  module ClientZone
    class ServicePresenter
      include Optimadmin::PresenterMethods

      presents :client_zone_service
      delegate :id, :title, to: :client_zone_service

      def toggle_title
        inline_detail_toggle_link(title)
      end

      def optimadmin_summary
        h.simple_format client_zone_service.summary
      end
    end
  end
end
