require "rails_helper"

feature "searching for a physio" do
  it "has a result" do
    practice = create(:practice, name: "Hull")

    visit root_path
    fill_in "physio_search_post_code", with: "HU1 1NQ"
    click_button "physio-search"

    expect(current_path).to eq("/find-a-physio")
    expect(page).to have_content "Hull"
  end

  it "has no results" do
    visit root_path
    fill_in "physio_search_post_code", with: "HU1 1NQ"
    click_button "physio-search"

    expect(current_path).to eq("/find-a-physio")
    expect(page).to have_content "Found 0 results"
  end
end
