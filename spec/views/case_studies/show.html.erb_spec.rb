require 'rails_helper'

RSpec.describe "case_studies/show", type: :view do
  context "with an image" do
    it "renders the image" do
      stub_global_site_settings
      case_study = create(:case_study_with_image)

      render_case_study(case_study)

      expect(rendered).to have_image
    end
  end

  context "without an image" do
    it "does not render an image" do
      stub_global_site_settings
      case_study = create(:case_study, image: nil)

      render_case_study(case_study)

      expect(rendered).not_to have_image
    end
  end

  def render_case_study(case_study)
    assign(:case_study, case_study)
    render
  end

  def stub_global_site_settings
    def view.global_site_settings
      {}
    end
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

