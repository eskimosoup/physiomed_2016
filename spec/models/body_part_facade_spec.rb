require "rails_helper"

describe BodyPartFacade do
  describe "delegations" do
    it do
      body_part = create(:body_part)
      facade = BodyPartFacade.new(body_part)

      expect(facade).to delegate_method(:name).to(:body_part)
    end

    it do
      body_part = create(:body_part)
      facade = BodyPartFacade.new(body_part)

      expect(facade).to delegate_method(:summary).to(:body_part)
    end
  end

  it '#body_part_sections' do
    body_part = create(:body_part)
    body_part_section = create(:body_part_section, body_part: body_part, display: true)

    facade = BodyPartFacade.new(body_part)

    expect(facade.body_part_sections).to include(body_part_section)
  end

  it '#people_helped_section' do
    body_part = create(:body_part, name: 'Ankle')
    people_helped_section = create(:people_helped_section, section: 'Ankle')

    facade = BodyPartFacade.new(body_part)
    expect(facade.people_helped_section).to eq(people_helped_section)
  end

  it '#articles' do
    body_part = BodyPart.new
    article = create(:article)

    facade = BodyPartFacade.new(body_part)
    expect(facade.articles).to include(article)
  end
end
