require "rails_helper"

RSpec.describe "wellbeing_zone/body_parts/show.html.erb" do
  context "has body part sections" do
    it 'renders body part section container' do
      facade = build_facade
      body_part_section = build_stubbed(:body_part_section)
      allow(facade).to receive(:body_part_sections).and_return([body_part_section])

      render

      expect(rendered).to have_body_part_section_container
    end
  end

  context "has no body part sections" do
    it 'does not render the body part section container' do
      facade = build_facade
      allow(facade).to receive(:body_part_sections).and_return([])

      render

      expect(rendered).not_to have_body_part_section_container
    end
  end

  context 'has guides' do
    it 'renders the guide section' do
      facade = build_facade
      guide = create(:guide, title: "Guide", content: "some content", display: true)
      allow(facade).to receive(:guides).and_return([guide])

      render

      expect(rendered).to have_guides_section_container
      expect(rendered).to have_css "h2", text: "Guide"
      expect(rendered).to have_css ".guide h3", text: "Guide"
      expect(rendered).to have_css ".guide", text: "some content"
      expect(rendered).to have_css ".guide a", text: "Download"
    end
  end

  context 'does not have guides' do
    it 'does not render the guides section' do
      facade = build_facade

      render

      expect(rendered).not_to have_guides_section_container
    end
  end

  def build_facade
    category = build_stubbed(:category)
    body_part = build_stubbed(:body_part, category: category)
    facade = BodyPartFacade.new(body_part)
    assign(:body_part_facade, facade)
    facade
  end

  def have_body_part_section_container
    have_css ".body-part-sections-container"
  end

  def have_guides_section_container
    have_css ".guides-container"
  end
end

