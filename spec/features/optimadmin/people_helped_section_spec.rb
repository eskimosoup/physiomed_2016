require "rails_helper"

describe "people helped section admin" do
  scenario "creation" do
    category = create(:category)

    go_to_people_helped_section_index
    click_link "New People Helped Section"
    fill_people_helped_section_form(
      title: "Some title",
      number: 11203,
      content: "Some blurb",
      link: "http://www.google.co.uk",
      category_id: category.name
    )
    click_button "Save"

    expect(page).to have_admin_index "Some title"
    expect(page).to have_admin_index category.name
  end

  scenario "editing" do
    category = create(:category)
    people_helped_section = create(:people_helped_section, title: "Some title", category: category)

    go_to_people_helped_section_index
    find(:href, optimadmin.edit_people_helped_section_path(people_helped_section)).click
    fill_people_helped_section_form(title: "New title")
    click_button "Save"

    expect(page).to have_admin_index "New title"
    expect(page).not_to have_admin_index "Some title"
  end

  scenario "destroying" do
    category = create(:category)
    people_helped_section = create(:people_helped_section, title: "Some title", category: category)

    go_to_people_helped_section_index
    click_href_destroy(optimadmin.people_helped_section_path(people_helped_section))

    expect(page).not_to have_admin_index "Some title"
  end

  def go_to_people_helped_section_index
    admin = create(:administrator)
    login_to_admin_as(admin)
    click_link "People Helped Sections"
  end

  def fill_people_helped_section_form(attrs = {})
    attrs.each do |attr, value|
      if select_fields.include?(attr)
        select value, from: "people_helped_section_#{ attr }"
      else
        fill_in "people_helped_section_#{ attr }", with: value
      end
    end
  end

  def select_fields
    %i( category_id )
  end
end
