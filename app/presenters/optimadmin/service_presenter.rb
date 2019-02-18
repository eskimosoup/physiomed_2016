module Optimadmin
  class ServicePresenter
    include Optimadmin::PresenterMethods

    presents :service
    delegate :id, :title, :sections_count, to: :service

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def manage_sections
      h.link_to "Manage #{h.pluralize(sections_count, ::Services::Section.model_name.human, ::Services::Section.model_name.human.pluralize)}", h.service_sections_path(service)
    end

    def optimadmin_summary
      # h.simple_format service.summary
    end

    def copy_link
      h.link_to 'Copy', h.new_service_path(service_id: service.id)
    end
  end
end
