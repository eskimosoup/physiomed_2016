module Optimadmin
  class BodyPartSectionPresenter
    include Optimadmin::PresenterMethods

    presents :body_part_section
    delegate :id, :title, to: :body_part_section

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format body_part_section.summary
    end
  end
end
