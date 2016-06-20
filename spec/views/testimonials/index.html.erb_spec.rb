require "rails_helper"

RSpec.describe "testimonials/index", type: :view do
  context "has testimonials" do
    it do
      testimonial = create(:testimonial, content: "My content")

      assign(:testimonials, [testimonial])
      render

      expect(rendered).to have_content "My content"
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
