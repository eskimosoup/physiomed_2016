require 'rails_helper'

RSpec.describe GeneralWellbeingFacade do
  it 'delegates content to category' do
    facade = GeneralWellbeingFacade.new(nil)

    expect(facade).to delegate_method(:content).to(:category)
  end

  describe '#guides' do
    it 'gets guides through category' do
      category = create(:category, name: "General Wellbeing")
      body_part = create(:body_part, category: category)
      guide = create(:guide, display: true, categories: [category])
      no_category_guide = create(:guide, display: true)
      facade = GeneralWellbeingFacade.new(category)

      expect(facade.guides).to include(guide)
      expect(facade.guides).not_to include(no_category_guide)
    end

    it 'gets displayed guides' do
      category = create(:category, name: "General Wellbeing")
      body_part = create(:body_part, category: category)
      guide = create(:guide, display: true, categories: [category])
      not_displayed = create(:guide, display: false, categories: [category])
      facade = GeneralWellbeingFacade.new(category)

      expect(facade.guides).to include(guide)
      expect(facade.guides).not_to include(not_displayed)
    end
  end

  it '#other_body_parts' do
    ankle = create(:category, name: "Ankle")
    body_part = create(:body_part, category: ankle)
    knee = create(:category, name: "Knee")
    other_body_part = create(:body_part, category: knee)
    facade = GeneralWellbeingFacade.new(nil)

    expect(facade.body_parts).to include(body_part)
    expect(facade.body_parts).to include(other_body_part)
  end
end
