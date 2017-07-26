module Optimadmin
  class LandingPagePresenter
    include Optimadmin::PresenterMethods

    presents :landing_page
    delegate :id, :title, to: :landing_page

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format landing_page.summary
    end
  end
end
