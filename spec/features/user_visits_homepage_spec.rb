require "rails_helper"

RSpec.feature "User visits homepage" do
  scenario "successfully" do
    visit root_path

    expect(page.find("#physiomed-logo")["title"]).to have_content("Physio Med")
  end
end
