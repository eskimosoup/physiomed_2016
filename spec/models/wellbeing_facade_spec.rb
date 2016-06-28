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
end
