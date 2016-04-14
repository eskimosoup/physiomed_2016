module Optimadmin
  class VideoPresenter
    include Optimadmin::PresenterMethods

    presents :video
    delegate :id, :title, to: :video

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format video.summary
    end
  end
end
