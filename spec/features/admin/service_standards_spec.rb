require "rails_helper"

feature "Service standard admin" do
  scenario "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Service Standards"
    click_link "New Service Standard"

    select "Clock", from: "service_standard_icon"
    fill_in "service_standard_content", with: "Some content"
    fill_in "service_standard_hover_content", with: "Some hover content"
    click_button "Save"

    expect(page).to have_admin_index "Some content"
  end

  scenario "editing" do
    admin = create(:administrator)
    standard = create(:service_standard, content: "Content")

    login_to_admin_as(admin)
    click_link "Service Standards"
    find(:href, optimadmin.edit_service_standard_path(standard)).click
    fill_in "service_standard_content", with: "Some content"
    click_button "Save"

    expect(page).to have_admin_index "Some content"
  end

  scenario "destroying" do
    admin = create(:administrator)
    standard = create(:service_standard, content: "Content")

    login_to_admin_as(admin)
    click_link "Service Standards"
    click_href_destroy(optimadmin.service_standard_path(standard))

    expect(page).not_to have_admin_index "Content"
  end
end
