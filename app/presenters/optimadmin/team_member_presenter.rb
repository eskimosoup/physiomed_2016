module Optimadmin
  class TeamMemberPresenter
    include Optimadmin::PresenterMethods

    presents :team_member
    delegate :id, :forename, :surname, to: :team_member

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def name
      [forename, surname].join(" ")
    end

    def optimadmin_summary
      # h.simple_format team_member.summary
    end
  end
end
