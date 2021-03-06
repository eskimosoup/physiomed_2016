require "rails_helper"

RSpec.feature "articles" do
  scenario "user views the index page then goes to the show page" do
    article = create(:article, title: "Article title", 
                     url_originally_posted_on: "http://www.google.com", 
                     date: Date.today, content: "My article content")

    visit articles_path
    click_link "Article title"

    expect(page).to have_css "h1", text: "Article title"
    expect(page).to have_content "My article content"
  end
end
