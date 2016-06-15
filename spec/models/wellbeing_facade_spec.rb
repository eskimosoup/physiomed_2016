require 'rails_helper'

describe WellbeingFacade do
  describe '#articles' do
    it 'only gets 4 articles' do
      create_list(:article, 5, display: true)
      facade = WellbeingFacade.new

      expect(facade.articles.size).to eq(4)
    end

    it 'only get displayed articles' do
      article = create(:article, display: true)
      not_displayed = create(:article, display: false)
      facade = WellbeingFacade.new

      expect(facade.articles).to include(article)
      expect(facade.articles).not_to include(not_displayed)
    end

    it 'ordered by descending date' do
      articles = [
        create(:article, display: true, date: Date.today),
        create(:article, display: true, date: Date.yesterday),
      ]
      facade = WellbeingFacade.new

      expect(facade.articles).to eq(articles)
    end
  end

  describe "#body_parts" do
    it 'gets displayed body parts ordered by position' do
      body_parts = [
        create(:body_part, name: "Elbow", display: true, position: 0),
        create(:body_part, name: "Ankle", display: true, position: 1),
      ]
      non_display_body_part = create(:body_part, name: "Foot", display: false)
      facade = WellbeingFacade.new

      expect(facade.body_parts).to eq(body_parts)
      expect(facade.body_parts).not_to include(non_display_body_part)
    end
  end

  describe "#case_studies" do
    it 'orders by descending date' do
      case_studies = [
        create(:case_study, display: true, date: Date.today),
        create(:case_study, display: true, date: Date.yesterday),
      ]
      facade = WellbeingFacade.new

      expect(facade.case_studies).to eq(case_studies)
    end

    it 'only gets those that are displayed' do
      case_study = create(:case_study, display: true)
      not_displayed = create(:case_study, display: false)
      facade = WellbeingFacade.new

      expect(facade.case_studies).to include(case_study)
      expect(facade.case_studies).not_to include(not_displayed)
    end

    it 'only gets three' do
      create_list(:case_study, 4, display: true)
      facade = WellbeingFacade.new

      expect(facade.case_studies.size).to eq(3)
    end
  end

  describe '#faqs' do
    it 'only gets displayed faqs' do
      faq = create(:frequently_asked_question, display: true)
      not_displayed = create(:frequently_asked_question, display: false)
      facade = WellbeingFacade.new

      expect(facade.faqs).to include(faq)
      expect(facade.faqs).not_to include(not_displayed)
    end

    it 'only gets six' do
      create_list(:frequently_asked_question, 7, display: true)
      facade = WellbeingFacade.new

      expect(facade.faqs.size).to eq(6)
    end
  end

  describe '#video' do
    it 'gets displayed video' do
      vid = create(:video, display: true)
      not_displayed = create(:video, display: false)
      facade = WellbeingFacade.new

      expect(facade.video).to eq(vid)
      expect(facade.video).not_to eq(not_displayed)
    end

    it 'gets the most recently created video' do
      old_vid = create(:video, display: true)
      vid = create(:video, display: true)
      facade = WellbeingFacade.new

      expect(facade.video).to eq(vid)
      expect(facade.video).not_to eq(old_vid)
    end
  end

  describe '#people_helped_section' do
    it 'gets one with a section of wellbeing zone' do
      correct_section = create(:people_helped_section, section: "Wellbeing Zone", display: true)
      incorrect_section = create(:people_helped_section, section: "Ankle", display: true)
      facade = WellbeingFacade.new

      expect(facade.people_helped_section).to eq(correct_section)
      expect(facade.people_helped_section).not_to eq(incorrect_section)
    end

    it 'as no section if not displayed' do
      section = create(:people_helped_section, section: "Wellbeing Zone", display: false)
      facade = WellbeingFacade.new

      expect(facade.people_helped_section).to be nil
    end

    it 'gets a displayed section' do
      section = create(:people_helped_section, section: "Wellbeing Zone", display: true)
      facade = WellbeingFacade.new

      expect(facade.people_helped_section).to eq(section)
    end
  end

  describe '#team_members' do
    it 'only gets 18' do
      create_list(:team_member, 19, display: true)
      facade = WellbeingFacade.new

      expect(facade.team_members.size).to eq(18)
    end

    it 'only gets displayed team members' do
      team_member = create(:team_member, display: true)
      not_displayed = create(:team_member, display: false)
      facade = WellbeingFacade.new

      expect(facade.team_members).to include(team_member)
      expect(facade.team_members).not_to include(not_displayed)
    end
  end

  describe '#testimonials' do
    it 'it gets displayed testimonials' do
      testimonial = create(:testimonial, display: true)
      not_displayed = create(:testimonial, display: false)
      facade = WellbeingFacade.new

      expect(facade.testimonials).to include(testimonial)
      expect(facade.testimonials).not_to include(not_displayed)
    end

    it 'only gets 8' do
      create_list(:testimonial, 9, display: true)
      facade = WellbeingFacade.new

      expect(facade.testimonials.size).to eq(8)
    end
  end
end
