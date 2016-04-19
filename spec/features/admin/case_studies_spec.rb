require "rails_helper"

feature "case study admin" do
  it "creation", js: true do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Case Studies"
    click_link "New Case Study"

    fill_case_study_form(
      title: "Title",
      summary: "My summary",
      content: "My content"
    )
    click_button "Save"

    expect(page).to have_admin_index "Title"
  end

  it "editing", js: true do
    admin = create(:administrator)
    case_study = create(:case_study, title: "Old Title")

    login_to_admin_as(admin)
    click_link "Case Studies"
    visit optimadmin.edit_case_study_path(case_study)

    fill_case_study_form(
      title: "New Title",
    )
    click_button "Save"

    expect(page).to have_admin_index "New Title"
  end
  
  it "destroying" do
    admin = create(:administrator)
    case_study = create(:case_study, title: "Old Title")

    login_to_admin_as(admin)
    click_link "Case Studies"
    click_href_destroy(optimadmin.case_study_path(case_study))

    expect(page).not_to have_admin_index "Old Title"
  end

  def fill_case_study_form(attrs = {})
    attrs.each do |attribute, value|
      if tiny_mce_fields.include?(attribute)
        tiny_mce_fill_in "case_study_#{ attribute }", with: value
      elsif select_fields.include?(attribute)
        select value, from: "case_study_#{ attribute }"
      else
        fill_in "case_study_#{ attribute }", with: value
      end
    end
  end

  def tiny_mce_fields
    %i( content )
  end

  def select_fields
    %i()
  end
end
