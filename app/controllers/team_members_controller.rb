class TeamMembersController < ApplicationController
  def index
    @team_members = TeamMember.displayed.order({ surname: :asc, forename: :asc })
  end

  def show
    @team_member = TeamMember.displayed.friendly.find(params[:id])
  end
end
