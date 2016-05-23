module Optimadmin
  class PeopleHelpedSectionPresenter
    include Optimadmin::PresenterMethods

    presents :people_helped_section
    delegate :id, :title, to: :people_helped_section

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format people_helped_section.summary
    end
  end
end
