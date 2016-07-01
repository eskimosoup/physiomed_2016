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

  context 'has displayed client' do
    it 'renders the client' do
      client = build(:client, display: true)
      case_study = create(:case_study, image: nil, displayed_client: client)

      render_case_study(case_study)

      expect(rendered).to have_client
    end
  end

  context 'has no client' do
    it 'does not render client' do
      case_study = create(:case_study, image: nil, displayed_client: nil)

      render_case_study(case_study)

      expect(rendered).not_to have_client
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

  def have_client
    have_css '[data-role="client"]'
  end
end

