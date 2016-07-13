require "rails_helper"

RSpec.feature "user views team member" do
  scenario "user visits team members index" do
    clinical = create(:team_member_category, title: "Cat A", category_type: 'Clinical')
    management = create(:team_member_category, title: "Cat B", category_type: 'Management')
    clinical_team_member = create(:team_member, forename: "Joe", surname: "Bloggs", 
                         team_member_categories: [clinical])
    management_team_member = create(:team_member, forename: "Jeff", surname: "Bridges", 
                         team_member_categories: [management])

    visit team_members_path

    expect(page).to have_css 'h2[data-role="team-member-category"]',
      text: clinical.title
    expect(page).to have_css 'h2[data-role="team-member-category"]',
      text: management.title
    expect(page).to have_content clinical_team_member.name
    expect(page).to have_content management_team_member.name
  end
end
