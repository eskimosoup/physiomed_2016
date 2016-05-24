module Optimadmin
  class ClientPresenter
    include Optimadmin::PresenterMethods

    presents :client
    delegate :id, :name, to: :client

    def title
      name
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format client.summary
    end
  end
end
