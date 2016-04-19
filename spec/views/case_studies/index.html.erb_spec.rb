require 'rails_helper'

RSpec.describe "case_studies/index", type: :view do
  context "with an image" do
    it "renders the image" do
      case_study = create(:case_study_with_image)

      render_case_studies(case_study)

      expect(rendered).to have_image
    end
  end

  context "without an image" do
    it "does not render an image" do
      case_study = create(:case_study, image: nil)

      render_case_studies(case_study)

      expect(rendered).not_to have_image
    end
  end

  def render_case_studies(case_study)
    assign(:case_studies, [case_study])
    render
  end

  def have_image
    have_css(".case-study img")
  end
end
