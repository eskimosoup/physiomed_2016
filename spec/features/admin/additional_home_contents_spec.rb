require "rails_helper"

describe "Additional home content admin" do
  it "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Additional Home Contents"
    click_link "New Additional Home Content"

    fill_in "additional_home_content_title", with: "Content"
    fill_in "additional_home_content_content", with: "Main content"
    select "text", from: "additional_home_content_content_type"
    click_button "Save"

    expect(page).to have_admin_index "Content"
  end

  it "editing" do
    admin = create(:administrator)
    home_content = create(:text_additional_home_content, title: "old title")

    login_to_admin_as(admin)
    click_link "Additional Home Contents"
    find(:href, optimadmin.edit_additional_home_content_path(home_content)).click

    fill_in "additional_home_content_title", with: "new title"
    click_button "Save"

    expect(page).to have_admin_index "new title"
  end

  it "destroying" do
    admin = create(:administrator)
    home_content = create(:text_additional_home_content, title: "old title")

    login_to_admin_as(admin)
    click_link "Additional Home Contents"
    click_href_destroy(optimadmin.additional_home_content_path(home_content))

    expect(page).not_to have_admin_index "old title"
  end
end
