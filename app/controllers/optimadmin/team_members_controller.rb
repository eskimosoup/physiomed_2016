module Optimadmin
  class TeamMembersController < Optimadmin::ApplicationController
    before_action :set_team_member, only: [:show, :edit, :update, :destroy]

    def index
      @team_members = TeamMember.order(surname: :asc, forename: :asc)
    end

    def show
    end

    def new
      @team_member = TeamMember.new
    end

    def edit
    end

    def create
      @team_member = TeamMember.new(team_member_params)
      if @team_member.save
        redirect_to_index_or_continue_editing(@team_member)
      else
        render :new
      end
    end

    def update
      if @team_member.update(team_member_params)
        redirect_to_index_or_continue_editing(@team_member)
      else
        render :edit
      end
    end

    def destroy
      @team_member.destroy
      redirect_to team_members_url, notice: 'Team member was successfully destroyed.'
    end

    private

    def set_team_member
      @team_member = TeamMember.friendly.find(params[:id])
    end

    def team_member_params
      params.require(:team_member)
            .permit(:forename, :surname, :image, :bio, :email, :phone, :role, :display, :remove_image, :remote_image_url, :image_cache)
    end
  end
end
