class CreateTeamMembersTeamMemberCategoriesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :team_members, :team_member_categories do |t|
      t.index [:team_member_id, :team_member_category_id], name: "team_member_category"
      t.index [:team_member_category_id, :team_member_id], name: "category_team_member"
    end
  end
end
