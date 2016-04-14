require "rails_helper"

describe HomeFacade do
  describe "#banners" do
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

  describe "quick links" do
    describe "#employer_quick_links" do
      it "gets displayed employer quick links" do
        displayed_employer_quick_link = create(:employer_quick_link, display: true)
        displayed_employee_quick_link = create(:employee_quick_link, display: true)
        not_displayed_employer_quick_link = create(:employer_quick_link, display: false)

        facade = HomeFacade.new

        expect(facade.employer_quick_links).to include(displayed_employer_quick_link)
        expect(facade.employer_quick_links).not_to include(displayed_employee_quick_link)
        expect(facade.employer_quick_links).not_to include(not_displayed_employer_quick_link)
      end

      it "is ordered" do
        first = create(:employer_quick_link, display: true, position: 0)
        last = create(:employer_quick_link, display: true, position: 1)

        facade = HomeFacade.new

        expect(facade.employer_quick_links.first).to eq(first)
        expect(facade.employer_quick_links.last).to eq(last)
      end
    end

    describe "#employee_quick_links" do
      it "gets displayed employer quick links" do
        displayed_employer_quick_link = create(:employer_quick_link, display: true)
        displayed_employee_quick_link = create(:employee_quick_link, display: true)
        not_displayed_employee_quick_link = create(:employee_quick_link, display: false)

        facade = HomeFacade.new

        expect(facade.employee_quick_links).to include(displayed_employee_quick_link)
        expect(facade.employee_quick_links).not_to include(displayed_employer_quick_link)
        expect(facade.employee_quick_links).not_to include(not_displayed_employee_quick_link)
      end

      it "is ordered" do
        first = create(:employee_quick_link, display: true, position: 0)
        last = create(:employee_quick_link, display: true, position: 1)

        facade = HomeFacade.new

        expect(facade.employee_quick_links.first).to eq(first)
        expect(facade.employee_quick_links.last).to eq(last)
      end
    end
  end

  describe "#health_zones" do
    it "gets displayed health zones" do
      displayed_health_zone = create(:health_zone, display: true)
      not_displayed_health_zone = create(:health_zone, display: false)

      facade = HomeFacade.new

      expect(facade.health_zones).to include(displayed_health_zone)
      expect(facade.health_zones).not_to include(not_displayed_health_zone)
    end

    it "orders the health zones" do
      first = create(:health_zone, display: true, position: 0)
      last = create(:health_zone, display: true, position: 1)

      facade = HomeFacade.new

      expect(facade.health_zones.first).to eq(first)
      expect(facade.health_zones.last).to eq(last)
    end
  end

  describe "#additional_contents" do
    it "gets displayed only" do
      displayed = create(:text_additional_home_content, display: true)
      not_displayed = create(:text_additional_home_content, display: false)

      facade = HomeFacade.new

      expect(facade.additional_contents).to include(displayed)
      expect(facade.additional_contents).not_to include(not_displayed)
    end

    it "orders them correctly" do
      last = create(:text_additional_home_content, display: true, position: 1)
      first = create(:text_additional_home_content, display: true, position: 0)

      facade = HomeFacade.new

      expect(facade.additional_contents.first).to eq(first)
      expect(facade.additional_contents.last).to eq(last)
    end
  end

  describe "#service_standards" do
    it "gets displayed only" do
      displayed = create(:service_standard, display: true)
      not_displayed = create(:service_standard, display: false)

      facade = HomeFacade.new

      expect(facade.service_standards).to include(displayed)
      expect(facade.service_standards).not_to include(not_displayed)
    end

    it "orders them correctly" do
      last = create(:service_standard, display: true, position: 1)
      first = create(:service_standard, display: true, position: 0)

      facade = HomeFacade.new

      expect(facade.service_standards.first).to eq(first)
      expect(facade.service_standards.last).to eq(last)
    end
  end
end
