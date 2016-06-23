require "rails_helper"

RSpec.feature "User visits homepage" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_css "img#physiomed-logo"
  end
end
