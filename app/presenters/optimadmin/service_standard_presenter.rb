module Optimadmin
  class ServiceStandardPresenter
    include Optimadmin::PresenterMethods

    presents :service_standard
    delegate :id, to: :service_standard
    delegate :content, to: :service_standard

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def title
      content
    end

    def optimadmin_summary
      # h.simple_format service_standard.summary
    end
  end
end
