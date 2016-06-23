require "rails_helper"

RSpec.feature "pages admin" do
  scenario "creation", js: true do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Pages"
    click_link "New Page"
    fill_page_form(
      title: "Page",
      content: "Some content"
    )
    click_button "Save"

    expect(page).to have_content "Page"
  end

  scenario "editing" do
    admin = create(:administrator)
    content_page = create(:page, title: "Page Title")

    login_to_admin_as(admin)
    click_link "Pages"
    find(:href, optimadmin.edit_page_path(content_page)).click
    fill_page_form(title: "New title")
    click_button "Save"

    expect(page).to have_content "New title"
    expect(page).not_to have_content "Page title"
  end

  scenario "destroying" do
    admin = create(:administrator)
    content_page = create(:page, title: "Page Title")

    login_to_admin_as(admin)
    click_link "Pages"
    click_href_destroy(optimadmin.page_path(content_page))

    expect(page).not_to have_content "Page Title"
  end

  def fill_page_form(attrs = {})
    attrs.each do |attr, value|
      if tiny_mce_fields.include?(attr)
        tiny_mce_fill_in "page_#{ attr }", with: value
      else
        fill_in "page_#{ attr }", with: value
      end
    end
  end

  def tiny_mce_fields
    %i( content )
  end
end
