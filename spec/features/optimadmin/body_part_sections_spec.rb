require "rails_helper"

describe "body part sections admin", type: :feature do
  it "creation", js: true do
    body_part = create_body_part_with_category(category_name: "Ankle")

    go_to_body_parts_index
    click_link "0 Sections"
    click_link "New Body Part Section"
    fill_body_part_section_form(
      title: "Common condition",
      sub_title: "A blah blah",
      content: "Some content"
    )
    click_button "Save"

    expect(page).to have_css "h1", text: "Ankle - Manage Body Part Sections"
    expect(page).to have_admin_index "Common condition"
  end

  it 'editing' do
    body_part = create_body_part_with_category
    body_part_section = create(:body_part_section, body_part: body_part, title: "Some title")

    go_to_body_parts_index
    click_link "1 Section"
    find(:href, optimadmin.edit_body_part_section_path(body_part_section)).click
    fill_body_part_section_form(
      title: "Blah"
    )
    click_button "Save"

    expect(page).to have_admin_index "Blah"
    expect(page).not_to have_admin_index "Some title"
  end

  it 'destroying' do
    body_part = create_body_part_with_category
    body_part_section = create(:body_part_section, body_part: body_part, title: "Some title")

    go_to_body_parts_index
    click_link "1 Section"
    click_href_destroy optimadmin.body_part_section_path(body_part_section)

    expect(page).not_to have_admin_index "Some title"
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

  def fill_body_part_section_form(attrs = {})
    attrs.each do |attr, value|
      if attr == :content
        tiny_mce_fill_in "body_part_section_#{ attr }", with: value
      else
        fill_in "body_part_section_#{ attr }", with: value
      end
    end
  end
end
