module Optimadmin
  class AdditionalHomeContentPresenter
    include Optimadmin::PresenterMethods

    presents :additional_home_content
    delegate :id, :title, to: :additional_home_content

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format additional_home_content.summary
    end
  end
end
