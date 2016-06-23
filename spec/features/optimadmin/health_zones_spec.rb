require "rails_helper"

RSpec.feature "Health zone admin" do
  it "creation", js: true do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Health Zones"
    click_link "New Health Zone"

    fill_in "health_zone_title", with: "Health Zone"
    fill_in "health_zone_hover_text", with: "Some hover text"
    fill_in "health_zone_link", with: "http://www.google.co.uk"
    tiny_mce_fill_in "health_zone_content", with: "Some content"
    click_link "Media"
    attach_file "health_zone_home_image", File.join("#{ Rails.root }/spec/support/images/landscape_image.jpg")
    click_button "Save"

    expect(page).to have_admin_index "Health Zone"
  end

  it "editing", js: true do
    admin = create(:administrator)
    health_zone = create(:health_zone, title: "Old title")

    login_to_admin_as(admin)
    visit optimadmin.edit_health_zone_path(health_zone)
    fill_in "health_zone_title", with: "New title"
    click_button "Save"

    expect(page).to have_admin_index "New title"
  end

  it "destroying" do
    admin = create(:administrator)
    health_zone = create(:health_zone, title: "Health Zone Title")

    login_to_admin_as(admin)
    click_link "Health Zones"
    click_href_destroy(optimadmin.health_zone_path(health_zone))

    expect(page).not_to have_admin_index "Health Zone Title"
  end
end
