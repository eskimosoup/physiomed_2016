require "rails_helper"

feature "visiting wellbeing zone body parts" do
  scenario "clicking through from the main wellbeing zone" do
    create(:body_part, name: "Ankle")

    visit wellbeing_zone_root_path
    click_link "Ankle"

    expect(page).to have_css "h1", text: "Ankle"
  end
end
