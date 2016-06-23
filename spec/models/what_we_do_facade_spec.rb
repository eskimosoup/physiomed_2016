require 'rails_helper'

RSpec.describe WhatWeDoFacade do
  describe '#what_we_dos' do
    it 'returns displayed what we dos' do
      displayed = create(:what_we_do, display: true)
      not_displayed = create(:what_we_do, display: false)
      facade = WhatWeDoFacade.new

      expect(facade.what_we_dos).to include(displayed)
      expect(facade.what_we_dos).not_to include(not_displayed)
    end

    it 'orders by position' do
      two = create(:what_we_do, display: true, position: 2)
      one = create(:what_we_do, display: true, position: 1)
      facade = WhatWeDoFacade.new

      expect(facade.what_we_dos).to eq([one, two])
    end
  end
end
