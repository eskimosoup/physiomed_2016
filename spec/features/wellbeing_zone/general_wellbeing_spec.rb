require 'rails_helper'

RSpec.feature "User visits the general wellbeing page" do
  scenario "by going directly to it" do
    visit wellbeing_zone_general_wellbeing_path

    expect(page).to have_css "h1", text: "General Well-Being"
  end
end
