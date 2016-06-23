require 'rails_helper'

RSpec.feature "Managing what we dos" do
  scenario "creating" do
    title = "We prevent people going off work"
    content = "Some content"

    go_to_index
    click_link "New What We Do"
    fill_in "what_we_do_title", with: title
    fill_in "what_we_do_content", with: content
    click_button "Save"

    expect(page).to have_admin_index title
  end

  context "the form is invalid" do
    scenario "creating" do
      go_to_index
      click_link "New What We Do"
      click_button "Save"

      expect(page).to have_content "Title can't be blank"
    end
  end

  scenario "editing" do
    what_we_do = create(:what_we_do, title: "We prevent people going off work")
    title = "New title"

    go_to_index
    find(:href, optimadmin.edit_what_we_do_path(what_we_do)).click
    fill_in "what_we_do_title", with: title
    click_button "Save"

    expect(page).to have_admin_index title
  end

  scenario "destroy" do
    what_we_do = create(:what_we_do, title: "We prevent people going off work")

    go_to_index
    click_href_destroy(optimadmin.what_we_do_path(what_we_do))

    expect(page).not_to have_admin_index "We prevent people going off work"
  end

  def go_to_index
    admin = create(:administrator)
    login_to_admin_as(admin)
    click_link "What We Dos"
  end
end
