require "rails_helper"

feature "user views team member" do
  scenario "user clicks into the team member" do
    team_member = create(:team_member, forename: "Joe", surname: "Bloggs")

    visit team_members_path
    click_link "Joe Bloggs"

    expect(page).to have_css "h1", text: "Joe Bloggs"
  end
end
