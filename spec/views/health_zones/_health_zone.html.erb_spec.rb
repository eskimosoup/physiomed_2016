require "rails_helper"

describe "health_zones/_health_zone.html.erb" do
  context "when health zone has content" do
    it "displays the content" do
      health_zone = build(:health_zone, title: "Health Zone", link: "http://www.google.co.uk", content: "Health zone content")

      render partial: "health_zones/health_zone.html.erb", locals: { health_zone: health_zone }

      expect(rendered).to have_css "h2", text: "Health Zone"
      expect(rendered).to have_link "Read more", href: "http://www.google.co.uk"
      expect(rendered).to have_css ".content", text: "Health zone content"
    end
  end

  context "when health zone has no content" do
    it "does not have a content div" do
      health_zone = build(:health_zone, title: "Health Zone", link: "http://www.google.co.uk", content: nil)

      render partial: "health_zones/health_zone.html.erb", locals: { health_zone: health_zone }

      expect(rendered).to have_css "h2", text: "Health Zone"
      expect(rendered).to have_link "Read more", href: "http://www.google.co.uk"
      expect(rendered).not_to have_css ".content"
    end
  end
end
