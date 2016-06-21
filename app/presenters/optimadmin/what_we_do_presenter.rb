module Optimadmin
  class WhatWeDoPresenter
    include Optimadmin::PresenterMethods

    presents :what_we_do
    delegate :id, :title, to: :what_we_do

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format what_we_do.summary
    end
  end
end
