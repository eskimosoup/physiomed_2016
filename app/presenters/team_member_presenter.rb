class TeamMemberPresenter < BasePresenter
  presents :team_member
  delegate :id, to: :team_member
end
