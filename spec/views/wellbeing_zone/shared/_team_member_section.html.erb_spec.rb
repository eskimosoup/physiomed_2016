require 'rails_helper'

describe 'wellbeing_zone/shared/_team_member_section.html.erb' do
  context 'with team members' do
    it 'renders the team member container' do
      team_members = build_stubbed_list(:team_member, 2)

      render "wellbeing_zone/shared/team_member_section", team_members: team_members

      expect(rendered).to have_css ".team-members-container"
    end
  end

  context 'with no team members' do
    it "doesn't render anything" do
      render "wellbeing_zone/shared/team_member_section", team_members: []

      expect(rendered).to be_blank
    end
  end
end
