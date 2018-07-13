module Optimadmin
  class AdditionalContentPresenter
    include Optimadmin::PresenterMethods

    presents :additional_content
      delegate :id, :title, to: :additional_content
    
    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format additional_content.summary
    end
  end
end
