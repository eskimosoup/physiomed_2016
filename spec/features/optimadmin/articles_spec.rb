require "rails_helper"

RSpec.feature "articles admin" do
  scenario "creation", js: true do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Articles"
    click_link "New Article"
    fill_article_form(
      title: "Some title",
      summary: "some summary",
      content: "some content",
    )
    click_button "Save"

    expect(page).to have_admin_index "Some title"
  end

  scenario "editing" do
    admin = create(:administrator)
    article = create(:article, title: "Old title")

    login_to_admin_as(admin)
    click_link "Articles"
    find(:href, optimadmin.edit_article_path(article)).click
    fill_article_form(title: "New title")
    click_button "Save"

    expect(page).to have_admin_index "New title"
  end

  scenario "destroying" do
    admin = create(:administrator)
    article = create(:article, title: "Old title")

    login_to_admin_as(admin)
    click_link "Articles"
    click_href_destroy optimadmin.article_path(article)

    expect(page).not_to have_admin_index "Old title"
  end

  def fill_article_form(attrs = {})
    attrs.each do |attribute, value|
      if tiny_mce_fields.include?(attribute)
        tiny_mce_fill_in "article_#{ attribute }", with: value
      elsif select_fields.include?(attribute)
        select value, from: "article_#{ attribute }"
      else
        fill_in "article_#{ attribute }", with: value
      end
    end
  end

  def tiny_mce_fields
    %i( content )
  end

  def select_fields
    %i( author_id )
  end
end
