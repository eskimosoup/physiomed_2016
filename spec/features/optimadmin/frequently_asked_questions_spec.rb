require "rails_helper"

RSpec.feature "Frequently asked questions" do
  it "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Frequently Asked Questions"
    click_link "New Frequently Asked Question"

    fill_faq_form(question: "Really?", answer: "Yes")
    click_button "Save"

    expect(page).to have_admin_index "Really?"
  end

  it "editing" do
    admin = create(:administrator)
    faq = create(:frequently_asked_question, question: "Some question?")

    login_to_admin_as(admin)
    click_link "Frequently Asked Questions"
    find(:href, optimadmin.edit_frequently_asked_question_path(faq)).click
    fill_faq_form(question: "Really?", answer: "Yes")
    click_button "Save"

    expect(page).to have_admin_index "Really?"
    expect(page).not_to have_admin_index "Some question?"
  end

  it "destroying" do
    admin = create(:administrator)
    faq = create(:frequently_asked_question, question: "Some question?")

    login_to_admin_as(admin)
    click_link "Frequently Asked Questions"
    click_href_destroy(optimadmin.frequently_asked_question_path(faq))

    expect(page).not_to have_admin_index "Some question?"
  end

  def fill_faq_form(attrs = {})
    attrs.each do |k,v|
      fill_in "frequently_asked_question_#{ k }", with: v
    end
  end
end
