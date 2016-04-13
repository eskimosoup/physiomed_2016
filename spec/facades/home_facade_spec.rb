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

  
end
