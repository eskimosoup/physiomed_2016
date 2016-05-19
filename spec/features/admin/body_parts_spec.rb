require "rails_helper"

describe "body parts admin" do
  it "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Body Parts"
    click_link "New Body Part"
    select "Knee", from: "body_part_name"
    fill_in "body_part_tagline", with: "Some tagline"
    click_button "Save"

    expect(page).to have_admin_index "Knee"
  end

  it "editing" do
    admin = create(:administrator)
    body_part = create(:body_part, name: BodyPart::BODY_PARTS.first)

    login_to_admin_as(admin)
    click_link "Body Parts"
    find(:href, optimadmin.edit_body_part_path(body_part)).click
    select BodyPart::BODY_PARTS.last, from: "body_part_name"
    click_button "Save"

    expect(page).to have_admin_index BodyPart::BodyParts.last
  end

  it "destroying" do
    admin = create(:administrator)
    body_part = create(:body_part)

    login_to_admin_as(admin)
    click_link "Body Parts"
    click_href_destroy optimadmin.body_part_path(body_part)

    expect(page).not_to have_admin_index body_part.name
  end
end
