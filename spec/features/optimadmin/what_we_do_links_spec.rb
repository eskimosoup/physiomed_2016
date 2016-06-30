require 'rails_helper'

RSpec.describe 'what we do links admin' do
  scenario "creation" do
    title = "My title"
    url = "https://www.google.co.uk"
    what_we_do = create(:what_we_do)
    dynamic_page = create(:page, title: "Page 1")

    go_to_what_we_do_index
    click_link "0 links"
    click_link "New What We Do Link"
    fill_in "what_we_do_link_title", with: title
    select "Page 1", from: "what_we_do_link_page_id"
    click_button "Save"

    expect(page).to have_admin_index title
  end

  context 'invalid form' do
    scenario 'creation' do
      title = "My title"
      what_we_do = create(:what_we_do)

      go_to_what_we_do_index
      click_link "0 links"
      click_link "New What We Do Link"
      click_button "Save"

      expect(page).to have_content "Title can't be blank"
    end
  end

  scenario "editing" do
    what_we_do = create(:what_we_do)
    dynamic_page = create(:page, title: "Page 1")
    link = create(:what_we_do_link, page: dynamic_page, what_we_do: what_we_do, title: "Title")

    go_to_what_we_do_index
    click_link "1 link"
    find(:href, optimadmin.edit_what_we_do_link_path(link)).click
    fill_in "what_we_do_link_title", with: "Link title"
    click_button "Save"

    expect(page).to have_admin_index "Link title"
  end

  scenario "destroying" do
    what_we_do = create(:what_we_do)
    dynamic_page = create(:page, title: "Page 1")
    link = create(:what_we_do_link, page: dynamic_page, what_we_do: what_we_do, title: "Lin")

    go_to_what_we_do_index
    click_link "1 link"
    click_href_destroy(optimadmin.what_we_do_link_path(link))

    expect(page).not_to have_admin_index "Lin"
  end

  def go_to_what_we_do_index
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "What We Dos"
  end
end
