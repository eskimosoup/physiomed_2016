require 'rails_helper'

RSpec.describe WellbeingFacade do
  describe "#body_parts" do
    it 'gets displayed body parts ordered by position' do
      elbow = create(:category, name: "Elbow")
      foot = create(:category, name: "Foot")
      body_part = create(:body_part, category: elbow, display: true, position: 0)
      non_display_body_part = create(:body_part, category: foot, display: false)
      facade = WellbeingFacade.new(nil)

      expect(facade.body_parts).to include(body_part)
      expect(facade.body_parts).not_to include(non_display_body_part)
    end
  end

  describe '#video' do
    it 'gets videos through the category' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      vid = create(:video, display: true, categories: [category])
      no_category_vid = create(:video, display: true)

      expect(facade.video).to eq(vid)
      expect(facade.video).not_to eq(no_category_vid)
    end

    it 'gets displayed video' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      vid = create(:video, display: true, categories: [category])
      not_displayed = create(:video, display: false, categories: [category])

      expect(facade.video).to eq(vid)
      expect(facade.video).not_to eq(not_displayed)
    end

    it 'gets the most recently created video' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      old_vid = create(:video, display: true, categories: [category])
      vid = create(:video, display: true, categories: [category])

      expect(facade.video).to eq(vid)
      expect(facade.video).not_to eq(old_vid)
    end
  end
end
