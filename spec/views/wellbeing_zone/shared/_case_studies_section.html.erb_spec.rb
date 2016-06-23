require 'rails_helper'

RSpec.describe 'wellbeing_zone/shared/case_studies_section.html.erb' do
  context 'with case studies' do
    it 'renders the case studies container' do
      case_studies = build_stubbed_list(:case_study, 2)

      render "wellbeing_zone/shared/case_studies_section", case_studies: case_studies

      expect(rendered).to have_css ".case-studies-container"
    end
  end

  context 'without case studies' do
    it 'does not render anything' do
      render "wellbeing_zone/shared/case_studies_section", case_studies: []

      expect(rendered).to be_blank
    end
  end
end
