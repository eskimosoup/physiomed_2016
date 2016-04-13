require "rails_helper"

describe HomeFacade do
  context "banners" do
    it "gets displayed banners" do
      displayed_banner = create(:banner, display: true)
      not_displayed_banner = create(:banner, display: false)

      facade = HomeFacade.new

      expect(facade.banners).to include(displayed_banner)
      expect(facade.banners).not_to include(not_displayed_banner)
    end

    it "gets ordered banners" do
      first_banner = create(:banner, position: 0)
      second_banner = create(:banner, position: 1)

      facade = HomeFacade.new

      expect(facade.banners.first).to eq(first_banner)
      expect(facade.banners.last).to eq(second_banner)
    end
  end
end
