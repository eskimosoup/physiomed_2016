require 'rails_helper'

RSpec.feature 'Guides admin' do
  it 'creation', js: true do
    file = File.join("#{ Rails.root }/spec/support/images/landscape_image.jpg")

    go_to_guides_index
    click_link "New Guide"
    disable_tabs

    fill_in "guide_title", with: "Guide"
    tiny_mce_fill_in "guide_content", with: "Content"
    attach_file "guide_file", file
    click_button "Save"

    expect(page).to have_admin_index "Guide"
  end

  it 'editing' do
    guide = create(:guide, title: "Old title")

    go_to_guides_index
    find(:href, optimadmin.edit_guide_path(guide)).click
    fill_in "guide_title", with: "New title"
    click_button "Save"

    expect(page).to have_admin_index "New title"
    expect(page).not_to have_admin_index "Old title"
  end

  it 'destroying' do
    guide = create(:guide, title: "Old title")

    go_to_guides_index
    click_href_destroy(optimadmin.guide_path(guide))

    expect(page).not_to have_admin_index "Old title"
  end

  def go_to_guides_index
    admin = create(:administrator)
    login_to_admin_as(admin)
    click_link "Guides"
  end
end
