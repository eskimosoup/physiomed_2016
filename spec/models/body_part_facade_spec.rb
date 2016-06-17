require "rails_helper"

describe BodyPartFacade do
  describe "delegations" do
    it do
      body_part = build_stubbed(:body_part)
      facade = build_facade(body_part: body_part)

      expect(facade).to delegate_method(:name).to(:body_part)
    end

    it do
      body_part = build_stubbed(:body_part)
      facade = build_facade(body_part: body_part)

      expect(facade).to delegate_method(:summary).to(:body_part)
    end
  end

  describe '#people_helped_section' do
    it 'gets one with a section of wellbeing zone' do
      incorrect_category = create(:category, name: "Wellbeing Zone Overview")
      incorrect_section = create(:people_helped_section, category: incorrect_category, display: true)
      correct_category = create(:category, name: "Ankle")
      correct_section = create(:people_helped_section, category: correct_category, display: true)
      body_part = create(:body_part, category: correct_category)
      facade = build_facade(body_part: body_part)

      expect(facade.people_helped_section).to eq(correct_section)
      expect(facade.people_helped_section).not_to eq(incorrect_section)
    end

    it 'has no section if not displayed' do
      category = create(:category, name: "Ankle")
      section = create(:people_helped_section, category: category, display: false)
      body_part = create(:body_part, category: category)
      facade = build_facade(body_part: body_part)

      expect(facade.people_helped_section).to be nil
    end

    it 'gets a displayed section' do
      category = create(:category, name: "Ankle")
      section = create(:people_helped_section, category: category, display: true)
      body_part = create(:body_part, category: category)
      facade = build_facade(body_part: body_part)

      expect(facade.people_helped_section).to eq(section)
    end
  end

  describe '#articles' do
    it 'only gets 4 articles' do
      create_list(:article, 4, display: true)
      facade = build_facade

      expect(facade.articles.size).to eq(3)
    end

    it 'only get displayed articles' do
      article = create(:article, display: true)
      not_displayed = create(:article, display: false)
      facade = build_facade

      expect(facade.articles).to include(article)
      expect(facade.articles).not_to include(not_displayed)
    end

    it 'ordered by descending date' do
      articles = [
        create(:article, display: true, date: Date.today),
        create(:article, display: true, date: Date.yesterday),
      ]
      facade = build_facade

      expect(facade.articles).to eq(articles)
    end
  end

  describe "#case_studies" do
    it 'orders by descending date' do
      case_studies = [
        create(:case_study, display: true, date: Date.today),
        create(:case_study, display: true, date: Date.yesterday),
      ]
      facade = build_facade

      expect(facade.case_studies).to eq(case_studies)
    end

    it 'only gets those that are displayed' do
      case_study = create(:case_study, display: true)
      not_displayed = create(:case_study, display: false)
      facade = build_facade

      expect(facade.case_studies).to include(case_study)
      expect(facade.case_studies).not_to include(not_displayed)
    end

    it 'only gets three' do
      create_list(:case_study, 4, display: true)
      facade = build_facade

      expect(facade.case_studies.size).to eq(3)
    end
  end

  describe '#faqs' do
    it 'only gets displayed faqs' do
      faq = create(:frequently_asked_question, display: true)
      not_displayed = create(:frequently_asked_question, display: false)
      facade = build_facade

      expect(facade.faqs).to include(faq)
      expect(facade.faqs).not_to include(not_displayed)
    end

    it 'only gets six' do
      create_list(:frequently_asked_question, 7, display: true)
      facade = build_facade

      expect(facade.faqs.size).to eq(6)
    end
  end

  describe '#testimonials' do
    it 'it gets displayed testimonials' do
      testimonial = create(:testimonial, display: true)
      not_displayed = create(:testimonial, display: false)
      facade = build_facade

      expect(facade.testimonials).to include(testimonial)
      expect(facade.testimonials).not_to include(not_displayed)
    end

    it 'only gets 8' do
      create_list(:testimonial, 9, display: true)
      facade = build_facade

      expect(facade.testimonials.size).to eq(8)
    end
  end

  describe '#team_members' do
    it 'only gets 12' do
      create_list(:team_member, 13, display: true)
      facade = build_facade

      expect(facade.team_members.size).to eq(12)
    end

    it 'only gets displayed team members' do
      team_member = create(:team_member, display: true)
      not_displayed = create(:team_member, display: false)
      facade = build_facade

      expect(facade.team_members).to include(team_member)
      expect(facade.team_members).not_to include(not_displayed)
    end
  end

  describe '#video' do
    it 'gets displayed video' do
      video = create(:video, display: true)
      not_displayed = create(:video, display: false)
      facade = build_facade

      expect(facade.video).to eq(video)
      expect(facade.video).not_to eq(not_displayed)
    end
  end

  describe '#guides' do
    it 'gets displayed guides' do
      guide = create(:guide, display: true)
      not_displayed = create(:guide, display: false)
      facade = build_facade

      expect(facade.guides).to include(guide)
      expect(facade.guides).not_to include(not_displayed)
    end

    it 'only gets two guides' do
      create_list(:guide, 3, display: true)
      facade = build_facade

      expect(facade.guides.size).to eq(2)
    end
  end

  def build_facade(body_part: nil)
    BodyPartFacade.new(body_part)
  end
end
