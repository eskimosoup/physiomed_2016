require 'rails_helper'

describe 'categories admin' do
  it 'creation' do
    go_to_category_index
    click_link "New Category"
    select "General", from: "category_name"
    click_button "Save"

    expect(page).to have_admin_index "General"
  end

  it 'editing' do
    category = create(:category, name: "General")

    go_to_category_index
    find(:href, optimadmin.edit_category_path(category)).click
    select "Knee", from: "category_name"
    click_button "Save"

    expect(page).to have_admin_index "Knee"
    expect(page).not_to have_admin_index "General"
  end

  it 'destroying' do
    category = create(:category, name: "General")

    go_to_category_index
    click_href_destroy(optimadmin.category_path(category))

    expect(page).not_to have_admin_index "General"
  end

  def go_to_category_index
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Categories"
  end
end
