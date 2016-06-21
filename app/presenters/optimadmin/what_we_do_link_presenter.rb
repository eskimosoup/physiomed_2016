module Optimadmin
  class WhatWeDoLinkPresenter
    include Optimadmin::PresenterMethods

    presents :what_we_do_link
    delegate :id, :title, to: :what_we_do_link

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
    end
  end
end
