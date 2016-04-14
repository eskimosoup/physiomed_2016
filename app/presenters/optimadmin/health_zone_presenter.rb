module Optimadmin
  class HealthZonePresenter
    include Optimadmin::PresenterMethods

    presents :health_zone
    delegate :id, :title, to: :health_zone

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format health_zone.summary
    end
  end
end
