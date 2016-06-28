class AddSlugToTeamMembers < ActiveRecord::Migration
  def change
    add_column :team_members, :slug, :string, index: true
  end
end
