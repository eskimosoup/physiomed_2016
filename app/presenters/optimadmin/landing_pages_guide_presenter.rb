module Optimadmin
  class LandingPagesGuidePresenter
    include Optimadmin::PresenterMethods

    presents :landing_pages_guide
    delegate :id, :title, to: :landing_pages_guide

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format landing_pages_guide.summary
    end
  end
end
