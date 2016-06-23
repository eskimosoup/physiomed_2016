require 'rails_helper'

RSpec.describe "wellbeing_zone/shared/_testimonials_section.html.erb" do
  context 'with testimonials' do
    it 'renders the testimonals section' do
      testimonials = build_stubbed_list(:testimonial, 2)

      render "wellbeing_zone/shared/testimonials_section", testimonials: testimonials

      expect(rendered).to have_css ".testimonials-container"
    end
  end

  context 'without testimonials' do
    it 'renders the testimonals section' do
      render "wellbeing_zone/shared/testimonials_section", testimonials: []

      expect(rendered).to be_blank
    end
  end
end
