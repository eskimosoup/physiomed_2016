require "rails_helper"

RSpec.describe "testimonials/index", type: :vide do
  context "has testimonials" do
    testimonial = create(:testimonial, title: "Title")

    assign(:testimonials, Testimonial.all)
    render

    expect(rendered).to have_content "Title"
  end

  context "has no testimonials" do
    assign(:testimonials, Testimonial.none)
    render

    expect(rendered).to have_content "We currently have no testimonials to display" 
  end
end
