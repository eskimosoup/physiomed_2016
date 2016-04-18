require "rails_helper"

feature "Practice admin" do
  scenario "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Practices"
    click_link "New Practice"
    fill_in "practice_name", with: "Test Practice"
    fill_in "practice_address", with: "Test"
    fill_in "practice_town", with: "Test"
    fill_in "practice_county", with: "Test"
    fill_in "practice_post_code", with: "HU1 1NQ"
    click_button "Save"

    expect(page).to have_admin_index "Test Practice"
  end

  scenario "editing" do
    admin = create(:administrator)
    practice = create(:practice, name: "Test practice")

    login_to_admin_as(admin)
    click_link "Practices"
    find(:href, optimadmin.edit_practice_path(practice)).click
    fill_in "practice_name", with: "New practice name"
    click_button "Save"

    expect(page).to have_admin_index "New practice name"
  end

  scenario "destroying" do
    admin = create(:administrator)
    practice = create(:practice, name: "Practice name")

    login_to_admin_as(admin)
    click_link "Practices"
    click_href_destroy(optimadmin.practice_path(practice))

    expect(page).not_to have_admin_index "Practice name"
  end
end
