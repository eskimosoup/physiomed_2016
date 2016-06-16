module Optimadmin
  class GuidePresenter
    include Optimadmin::PresenterMethods

    presents :guide
    delegate :id, :title, to: :guide

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format guide.summary
    end
  end
end
