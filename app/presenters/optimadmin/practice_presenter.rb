module Optimadmin
  class PracticePresenter
    include Optimadmin::PresenterMethods

    presents :practice
    delegate :id, :name, to: :practice

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      # h.simple_format practice.summary
    end
  end
end
