require "rails_helper"

RSpec.feature "Employee quick links admin" do
  it "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Employee Quick Links"
    click_link "New Employee Quick Link"

    fill_in "employee_quick_link_link", with: "http://www.google.co.uk"
    fill_in "employee_quick_link_link_text", with: "Read more"
    click_button "Save"

    expect(page).to have_admin_index "Read more"
  end

  it "editing" do
    admin = create(:administrator)
    quick_link = create(:employee_quick_link, link_text: "blah")

    login_to_admin_as(admin)
    visit optimadmin.edit_employee_quick_link_path(quick_link)
    fill_in "employee_quick_link_link_text", with: "Read more"
    click_button "Save"

    expect(page).to have_admin_index "Read more"
  end

  it "destroying" do
    admin = create(:administrator)
    quick_link = create(:employee_quick_link, link_text: "blah")

    login_to_admin_as(admin)
    click_link "Employee Quick Links"
    click_href_destroy(optimadmin.employee_quick_link_path(quick_link))

    expect(page).not_to have_admin_index "blah"
  end
end
