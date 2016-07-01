require 'rails_helper'

RSpec.describe "case_studies/show", type: :view do
  context "with an image" do
    it "renders the image" do
      case_study = create(:case_study_with_image)

      render_case_study(case_study)

      expect(rendered).to have_image
    end
  end

  context "without an image" do
    it "does not render an image" do
      case_study = create(:case_study, image: nil)

      render_case_study(case_study)

      expect(rendered).not_to have_image
    end
  end

  context 'has testimonials' do
    it 'renders the testimonials' do
      testimonial = build(:testimonial, display: true)
      case_study = create(:case_study, image: nil, testimonials: [testimonial])

      render_case_study(case_study)

      expect(rendered).to have_testimonial
    end
  end

  context 'no testimonials' do
    it 'does not render testimonials' do
      case_study = create(:case_study, image: nil, testimonials: [])

      render_case_study(case_study)

      expect(rendered).not_to have_testimonial
    end
  end

  def render_case_study(case_study)
    assign(:case_study, case_study)
    render
  end

  def have_image
    have_css("img")
  end

  def have_testimonial
    have_css '[data-role="testimonial"]'
  end
end

