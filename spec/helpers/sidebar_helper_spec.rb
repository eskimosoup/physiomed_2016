require 'rails_helper'

RSpec.describe SidebarHelper, type: :helper do
  context 'wellbeing zone health zone exists' do
    it '#wellbeing_zone_health_zone' do
      health_zone = create(:health_zone, link: '/well-being-zone')

      expect(helper.wellbeing_zone_health_zone).to eq(health_zone)
    end
  end

  context 'wellbeing zone health zone does not exist' do
    it '#wellbeing_zone_health_zone' do
      expect(helper.wellbeing_zone_health_zone).to eq(nil)
    end
  end

  it '#latest_articles' do
    articles = create_list(:article, 2, display: true)

    expect(helper.latest_articles).to eq(articles)
  end

  it '#latest_case_studies' do
    case_studies = create_list(:case_study, 2, display: true)
    
    expect(helper.latest_case_studies).to eq(case_studies)
  end
end
