require "rails_helper"

feature "visiting wellbeing zone body parts" do
  scenario "clicking through from the main wellbeing zone" do
    category = create(:category, name: "Ankle")
    create(:body_part, category: category, summary: "Some summary")

    visit wellbeing_zone_root_path
    click_link "Ankle"

    expect(page).to have_css "h1", text: "Ankle"
    expect(page).to have_css ".body-part-summary", text: "Some summary"
  end

  scenario "clicking between body part sections by tab", js: true do
    category = create(:category, name: "Ankle")
    body_part = create(:body_part, category: category, summary: "Some summary")
    create(:body_part_section, body_part: body_part, title: "common condition",
           sub_title: "sub title common", position: 0)
    create(:body_part_section, body_part: body_part, title: "anatomy",
           sub_title: "sub title anatomy", content: "some content", position: 1)

    visit wellbeing_zone_body_part_path(body_part)
    click_link "anatomy"

    expect(page).to have_css ".body-part-section h2", text: "anatomy".upcase
    expect(page).to have_css ".body-part-section h3", text: "sub title anatomy"
    expect(page).to have_css ".body-part-section", text: "some content"
    expect(page).not_to have_css ".body-part-section h2", text: "common condition".upcase
  end
end
