require "rails_helper"

describe "wellbeing_zone/body_parts/show.html.erb" do
  describe "body part sections" do
    context "has body part sections" do
      it 'renders body part section container' do
        facade = BodyPartFacade.new(BodyPart.new)
        body_part_section = build_stubbed(:body_part_section)
        allow(facade).to receive(:body_part_sections).and_return([body_part_section])
        assign(:body_part_facade, facade)

        render

        expect(rendered).to have_body_part_section_container
      end
    end

    context "has no body part sections" do
      it 'does not render the body part section container' do
        facade = BodyPartFacade.new(BodyPart.new)
        allow(facade).to receive(:body_part_sections).and_return([])
        assign(:body_part_facade, facade)

        render

        expect(rendered).not_to have_body_part_section_container
      end
    end

    def have_body_part_section_container
      have_css ".body-part-sections-container"
    end
  end
end

