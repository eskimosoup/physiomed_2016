module Optimadmin
  class QuickLinkPresenter
    include Optimadmin::PresenterMethods

    presents :quick_link
    delegate :id, to: :quick_link
    delegate :link_text, to: :quick_link
    delegate :link, to: :quick_link

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def title
      link_text
    end

    def view_link
      h.link_to link, link, target: "_blank"
    end

    def optimadmin_summary
      # h.simple_format employee_quick_link.summary
    end
  end
end
