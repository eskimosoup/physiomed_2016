module Optimadmin
  class BodyPartPresenter
    include Optimadmin::PresenterMethods

    presents :body_part
    delegate :id, :name, to: :body_part

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      # h.simple_format body_part.summary
    end
  end
end
