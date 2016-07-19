module Optimadmin
  class GuidePresenter
    include Optimadmin::PresenterMethods

    presents :guide
    delegate :id, :title, to: :guide

    def view_link
      h.link_to eye, guide.file.url, target: '_blank', class: 'menu-item-control'
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format guide.summary
    end
  end
end
