module Optimadmin
  class BannerPresenter
    include Optimadmin::PresenterMethods

    presents :banner
    delegate :id, :title, to: :banner

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format banner.summary
    end
  end
end
