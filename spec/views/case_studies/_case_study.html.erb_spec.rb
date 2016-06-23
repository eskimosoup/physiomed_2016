require 'rails_helper'

RSpec.describe "case_studies/_case_study", type: :view do
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

  def render_case_study(case_study)
    render partial: "case_studies/case_study.html.erb",
      locals: { case_study: case_study }
  end

  def have_image
    have_css(".case-study img")
  end
end
