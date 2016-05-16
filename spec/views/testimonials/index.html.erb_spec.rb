require "rails_helper"

RSpec.describe "testimonials/index", type: :view do
  context "has testimonials" do
    it do
      testimonial = create(:testimonial, title: "Title")

      assign(:testimonials, Testimonial.all)
      render

      expect(rendered).to have_content "Title"
    end
  end

  context "has no testimonials" do
    it do
      assign(:testimonials, Testimonial.none)
      render

      expect(rendered).to have_content "We currently have no testimonials to display" 
    end
  end
end
