require "rails_helper"

RSpec.feature "case studies" do
  scenario "user views the index page" do
    case_study = create(:case_study, title: "Case Study #1", content: "Awesome stuff")

    visit case_studies_path

    expect(page).to have_content "Case Study #1"
    expect(page).to have_link "Case Study #1", href: case_study_path(case_study)
    expect(page).to have_link "Read more", href: case_study_path(case_study)
  end
end
