module Optimadmin
  class TeamMemberCategoriesController < Optimadmin::ApplicationController
    def index
      @team_member_categories = TeamMemberCategory.order(position: :asc)
    end

    def new
      @team_member_category = TeamMemberCategory.new
    end

    def create
      @team_member_category = TeamMemberCategory.new(team_member_category_params)
      if @team_member_category.save
        redirect_to_index_or_continue_editing(@team_member_category)
      else
        render :new
      end
    end

    def edit
      @team_member_category = find_team_member_category
    end

    def update
      @team_member_category = find_team_member_category
      if @team_member_category.update(team_member_category_params)
        redirect_to_index_or_continue_editing(@team_member_category)
      else
        render :edit
      end
    end

    def destroy
      @team_member_category = find_team_member_category
      @team_member_category.destroy
      redirect_to team_member_categories_path
    end

    private

    def find_team_member_category
      TeamMemberCategory.find(params[:id])
    end

    def team_member_category_params
      params.require(:team_member_category).permit(:title, :category_type)
    end
  end
end
