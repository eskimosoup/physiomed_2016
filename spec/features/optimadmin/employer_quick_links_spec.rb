require "rails_helper"

RSpec.feature "Employer quick links admin" do
  it "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Employer Quick Links"
    click_link "New Employer Quick Link"

    fill_in "employer_quick_link_link", with: "http://www.google.co.uk"
    fill_in "employer_quick_link_link_text", with: "Read more"
    click_button "Save"

    expect(page).to have_admin_index "Read more"
  end

  it "editing" do
    admin = create(:administrator)
    quick_link = create(:employer_quick_link, link_text: "blah")

    login_to_admin_as(admin)
    visit optimadmin.edit_employer_quick_link_path(quick_link)
    fill_in "employer_quick_link_link_text", with: "Read more"
    click_button "Save"

    expect(page).to have_admin_index "Read more"
  end

  it "destroying" do
    admin = create(:administrator)
    quick_link = create(:employer_quick_link, link_text: "blah")

    login_to_admin_as(admin)
    click_link "Employer Quick Links"
    click_href_destroy(optimadmin.employer_quick_link_path(quick_link))

    expect(page).not_to have_admin_index "blah"
  end
end
