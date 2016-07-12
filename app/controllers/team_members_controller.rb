class TeamMembersController < ApplicationController
  def index
    @team_member_categories = TeamMemberCategory.includes(:displayed_team_members).order(:position)
  end

  def show
    @team_member = TeamMember.displayed.friendly.find(params[:id])
    render layout: false, template: 'team_members/modal' if request.xhr?
  end
end
