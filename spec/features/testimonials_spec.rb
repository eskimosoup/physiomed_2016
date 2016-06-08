require "rails_helper"

feature "user views testmonials" do
  scenario "by clicking view all on the home page" do
    create(:testimonial, title: "My Testimonial", content: "They were ace!")

    visit testimonials_path

    expect(page).to have_css ".testimonial", text: "My Testimonial"
    expect(page).to have_css ".testimonial", text: "They were ace!"
  end
end
