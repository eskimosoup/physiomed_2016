module Optimadmin
  class CaseStudyPresenter
    include Optimadmin::PresenterMethods

    presents :case_study
    delegate :id, :title, to: :case_study

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      # h.simple_format case_study.summary
    end
  end
end
