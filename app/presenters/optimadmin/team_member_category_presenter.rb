module Optimadmin
  class TeamMemberCategoryPresenter
    include Optimadmin::PresenterMethods

    presents :team_member_category
    delegate :id, :title, to: :team_member_category

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
    end
  end
end
