require 'rails_helper'

RSpec.feature 'team member categories', type: :feature do
  context 'successfully created' do
    scenario 'creation' do
      category_title = "Category A"

      visit_team_member_categories_index
      click_link "New Team Member Category"
      fill_team_member_category_form(
        title: category_title
      )
      click_button "Save"

      expect(page).to have_admin_index category_title
    end
  end

  context 'with errors' do
    scenario 'creation' do
      visit_team_member_categories_index
      click_link "New Team Member Category"
      fill_team_member_category_form
      click_button "Save"

      expect(page).to have_content "Title can't be blank"
    end
  end

  scenario 'editing' do
    category = create(:team_member_category, title: "A")

    visit_team_member_categories_index
    find(:href, optimadmin.edit_team_member_category_path(category)).click
    fill_team_member_category_form(
      title: "B"
    )
    click_button "Save"

    expect(page).to have_admin_index "B"
  end

  scenario 'destroying' do
    category = create(:team_member_category, title: "A")

    visit_team_member_categories_index
    click_href_destroy(
      optimadmin.team_member_category_path(category)
    )

    expect(page).not_to have_admin_index "A"
  end

  def visit_team_member_categories_index
    admin = create(:administrator)
    login_to_admin_as(admin)
    click_link "Team Member Categories"
  end

  def fill_team_member_category_form(attrs = {})
    attrs.each do |attr, value|
      fill_in field_name(attr), with: value
    end
  end

  def field_name(attr)
    "team_member_category_#{ attr }"
  end
end
