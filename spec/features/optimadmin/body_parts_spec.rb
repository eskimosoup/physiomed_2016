require "rails_helper"

describe "body parts admin", type: :feature do
  it "creation", js: true do
    create(:category, name: "Knee")

    go_to_body_parts_index
    click_link "New Body Part"
    select "Knee", from: "body_part_category_id"
    fill_in "body_part_tagline", with: "Some tagline"
    tiny_mce_fill_in "body_part_summary", with: "Some text"
    click_button "Save"

    expect(page).to have_admin_index "Knee"
  end

  it "editing" do
    body_part = create_body_part_with_category(category_name: "Ankle")
    new_category = create(:category, name: "Lower Leg")

    go_to_body_parts_index
    find(:href, optimadmin.edit_body_part_path(body_part)).click
    select "Lower Leg", from: "body_part_category_id"
    click_button "Save"

    expect(page).to have_admin_index "Lower Leg"
  end

  it "destroying" do
    body_part = create_body_part_with_category(category_name: "Ankle")

    go_to_body_parts_index
    click_href_destroy optimadmin.body_part_path(body_part)

    expect(page).not_to have_admin_index "Ankle"
  end

  def create_body_part_with_category(category_name: "Ankle")
    category = create(:category, name: category_name)
    create(:body_part, category: category)
  end

  def go_to_body_parts_index
    admin = create(:administrator)
    login_to_admin_as(admin)
    click_link "Body Parts"
  end
end
