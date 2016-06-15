require "rails_helper"

feature "Banner admin" do
  it "creation", js: true do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Banners"
    click_link "New Banner"

    fill_in "banner_title", with: "Banner title"
    fill_in "banner_summary", with: "Summary text"
    click_link "Media"
    attach_file "banner_image", File.join("#{ Rails.root }/spec/support/images/landscape_image.jpg")
    click_button "Save"

    expect(page).to have_admin_index "Banner title"
  end

  it "editing", js: true do
    admin = create(:administrator)
    banner = create(:banner, title: "Banner title")

    login_to_admin_as(admin)
    click_link "Banners"
    visit optimadmin.edit_banner_path(banner)
    fill_in "banner_title", with: "New banner title"
    click_button "Save"

    expect(page).to have_admin_index "New banner title"
  end

  it "destroying" do
    admin = create(:administrator)
    banner = create(:banner, title: "Banner title")

    login_to_admin_as(admin)
    click_link "Banners"
    click_href_destroy(optimadmin.banner_path(banner))

    expect(page).not_to have_admin_index "Banner title"
  end
end
