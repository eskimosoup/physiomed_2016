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
    people_helped_section = create(:people_helped_section, section: 'Ankle', display: true)
    facade = BodyPartFacade.new(body_part)

    expect(facade.people_helped_section).to eq(people_helped_section)
  end

  it '#articles' do
    body_part = BodyPart.new
    article = create(:article, display: true)
    facade = BodyPartFacade.new(body_part)

    expect(facade.articles).to include(article)
  end

  it '#case_studies' do
    body_part = BodyPart.new
    case_study = create(:case_study, display: true)
    facade = BodyPartFacade.new(body_part)

    expect(facade.case_studies).to include(case_study)
  end

  it '#faqs' do
    body_part = BodyPart.new
    faq = create(:frequently_asked_question, display: true)
    facade = BodyPartFacade.new(body_part)

    expect(facade.faqs).to include(faq)
  end

  it '#testimonials' do
    body_part = BodyPart.new
    testimonial = create(:testimonial, display: true)
    facade = BodyPartFacade.new(body_part)

    expect(facade.testimonials).to include(testimonial)
  end

  it '#team_members' do
    body_part = BodyPart.new
    team_member = create(:team_member, display: true)
    facade = BodyPartFacade.new(body_part)

    expect(facade.team_members).to include(team_member)
  end

  it '#video' do
    body_part = BodyPart.new
    video = create(:video, display: true)
    facade = BodyPartFacade.new(body_part)

    expect(facade.video).to eq(video)
  end
end
