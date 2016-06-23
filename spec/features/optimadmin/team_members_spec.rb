require "rails_helper"

RSpec.feature "team member admin" do
  scenario "creation" do
    admin = create(:administrator)

    go_to_team_members_index(admin: admin)
    click_link "New Team Member"

    fill_team_member_form(
      forename: "Joe",
      surname: "Bloggs",
      email: "joe.bloggs@example.com",
      role: "Physiotherapist"
    )
    click_button "Save"

    expect(page).to have_admin_index "Joe Bloggs"
  end

  scenario "editing" do
    admin = create(:administrator)
    team_member = create(:team_member, forename: "Jeff")

    go_to_team_members_index(admin: admin)
    find(:href, optimadmin.edit_team_member_path(team_member)).click
    fill_team_member_form(forename: "Jack")
    click_button "Save"

    expect(page).to have_admin_index "Jack"
  end

  scenario "destroying" do
    admin = create(:administrator)
    team_member = create(:team_member, forename: "Jeff")

    go_to_team_members_index(admin: admin)
    click_href_destroy(optimadmin.team_member_path(team_member))

    expect(page).not_to have_admin_index "Jeff"
  end

  def go_to_team_members_index(admin:)
    login_to_admin_as(admin)
    click_link "Team Members"
  end

  def fill_team_member_form(attrs = {})
    attrs.each do |attribute, value|
      if tiny_mce_fields.include?(attribute)
        tiny_mce_fill_in "team_member_#{ attribute }", with: value
      else
        fill_in "team_member_#{ attribute }", with: value
      end
    end
  end

  def tiny_mce_fields
    %i( bio )
  end
end
