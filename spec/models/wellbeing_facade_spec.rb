require 'rails_helper'

describe WellbeingFacade do
  describe '#articles' do
    it 'gets articles belonging to the category' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      article = create(:article, display: true, categories: [category])
      no_category_article = create(:article, display: true)

      expect(facade.articles).to include(article)
      expect(facade.articles).not_to include(no_category_article)
    end

    it 'only gets 4 articles' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      create_list(:article, 5, display: true, categories: [category])

      expect(facade.articles.size).to eq(4)
    end

    it 'only get displayed articles' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      article = create(:article, display: true, categories: [category])
      not_displayed = create(:article, display: false, categories: [category])

      expect(facade.articles).to include(article)
      expect(facade.articles).not_to include(not_displayed)
    end

    it 'ordered by descending date' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      articles = [
        create(:article, display: true, date: Date.today, categories: [category]),
        create(:article, display: true, date: Date.yesterday, categories: [category]),
      ]

      expect(facade.articles).to eq(articles)
    end
  end

  describe "#body_parts" do
    it 'gets displayed body parts ordered by position' do
      elbow = create(:category, name: "Elbow")
      foot = create(:category, name: "Foot")
      body_part = create(:body_part, category: elbow, display: true, position: 0)
      non_display_body_part = create(:body_part, category: foot, display: false)
      facade = WellbeingFacade.new(nil)

      expect(facade.body_parts).to include(body_part)
      expect(facade.body_parts).not_to include(non_display_body_part)
    end
  end

  describe "#case_studies" do
    it 'gets case studies belonging to category' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      case_study = create(:case_study, display: true, categories: [category])
      no_category_case_study = create(:case_study, display: true)

      expect(facade.case_studies).to include(case_study)
      expect(facade.case_studies).not_to include(no_category_case_study)
    end

    it 'orders by descending date' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      case_studies = [
        create(:case_study, display: true, date: Date.today, categories: [category]),
        create(:case_study, display: true, date: Date.yesterday, categories: [category]),
      ]

      expect(facade.case_studies).to eq(case_studies)
    end

    it 'only gets those that are displayed' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      case_study = create(:case_study, display: true, categories: [category])
      not_displayed = create(:case_study, display: false, categories: [category])

      expect(facade.case_studies).to include(case_study)
      expect(facade.case_studies).not_to include(not_displayed)
    end

    it 'only gets three' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      create_list(:case_study, 4, display: true, categories: [category])

      expect(facade.case_studies.size).to eq(3)
    end
  end

  describe '#faqs' do
    it 'gets faqs belonging to the category' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      faq = create(:frequently_asked_question, display: true, categories: [category])
      no_category_faq = create(:frequently_asked_question, display: true)

      expect(facade.faqs).to include(faq)
      expect(facade.faqs).not_to include(no_category_faq)
    end

    it 'only gets displayed faqs' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      faq = create(:frequently_asked_question, display: true, categories: [category])
      not_displayed = create(:frequently_asked_question, display: false, categories: [category])

      expect(facade.faqs).to include(faq)
      expect(facade.faqs).not_to include(not_displayed)
    end

    it 'only gets six' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      create_list(:frequently_asked_question, 7, display: true, categories: [category])

      expect(facade.faqs.size).to eq(6)
    end
  end

  describe '#video' do
    it 'gets videos through the category' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      vid = create(:video, display: true, categories: [category])
      no_category_vid = create(:video, display: true)

      expect(facade.video).to eq(vid)
      expect(facade.video).not_to eq(no_category_vid)
    end

    it 'gets displayed video' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      vid = create(:video, display: true, categories: [category])
      not_displayed = create(:video, display: false, categories: [category])

      expect(facade.video).to eq(vid)
      expect(facade.video).not_to eq(not_displayed)
    end

    it 'gets the most recently created video' do
      category = create(:category, name: "General Wellbeing")
      facade = WellbeingFacade.new(category)
      old_vid = create(:video, display: true, categories: [category])
      vid = create(:video, display: true, categories: [category])

      expect(facade.video).to eq(vid)
      expect(facade.video).not_to eq(old_vid)
    end
  end

  describe '#people_helped_section' do
    it 'gets it through the category' do
      category = create(:category, name: "General Wellbeing")
      correct_section = create(:people_helped_section, category: category, display: true)
      incorrect_category = create(:category, name: "Ankle")
      incorrect_section = create(:people_helped_section, category: incorrect_category, display: true)
      facade = WellbeingFacade.new(category)

      expect(facade.people_helped_section).to eq(correct_section)
      expect(facade.people_helped_section).not_to eq(incorrect_section)
    end

    it 'as no section if not displayed' do
      category = create(:category, name: "General Wellbeing")
      section = create(:people_helped_section, category: category, display: false)
      facade = WellbeingFacade.new(category)

      expect(facade.people_helped_section).to be nil
    end

    it 'gets a displayed section' do
      category = create(:category, name: "General Wellbeing")
      section = create(:people_helped_section, category: category, display: true)
      facade = WellbeingFacade.new(category)

      expect(facade.people_helped_section).to eq(section)
    end
  end

  describe '#team_members' do
    it 'only gets 18' do
      create_list(:team_member, 19, display: true)
      facade = WellbeingFacade.new(nil)

      expect(facade.team_members.size).to eq(18)
    end

    it 'only gets displayed team members' do
      team_member = create(:team_member, display: true)
      not_displayed = create(:team_member, display: false)
      facade = WellbeingFacade.new(nil)

      expect(facade.team_members).to include(team_member)
      expect(facade.team_members).not_to include(not_displayed)
    end
  end

  describe '#testimonials' do
    it 'gets testimonials through categories' do
      category = create(:category, name: "General Wellbeing")
      testimonial = create(:testimonial, display: true, categories: [category])
      no_category = create(:testimonial, display: true)
      facade = WellbeingFacade.new(category)

      expect(facade.testimonials).to include(testimonial)
      expect(facade.testimonials).not_to include(no_category)
    end

    it 'gets displayed testimonials' do
      category = create(:category, name: "General Wellbeing")
      testimonial = create(:testimonial, display: true, categories: [category])
      not_displayed = create(:testimonial, display: false, categories: [category])
      facade = WellbeingFacade.new(category)

      expect(facade.testimonials).to include(testimonial)
      expect(facade.testimonials).not_to include(not_displayed)
    end

    it 'only gets 8' do
      category = create(:category, name: "General Wellbeing")
      create_list(:testimonial, 9, display: true, categories: [category])
      facade = WellbeingFacade.new(category)

      expect(facade.testimonials.size).to eq(8)
    end
  end

  context 'when category is nil' do
    it '#articles' do
      facade = WellbeingFacade.new(nil)

      expect(facade.articles).to eq([])
    end

    it '#case_studies' do
      facade = WellbeingFacade.new(nil)

      expect(facade.case_studies).to eq([])
    end

    it '#faqs' do
      facade = WellbeingFacade.new(nil)

      expect(facade.faqs).to eq([])
    end

    it '#video' do
      facade = WellbeingFacade.new(nil)

      expect(facade.video).to be nil
    end

    it '#people_helped_section' do
      facade = WellbeingFacade.new(nil)

      expect(facade.people_helped_section).to be nil
    end

    it '#testimonials' do
      facade = WellbeingFacade.new(nil)

      expect(facade.testimonials).to eq([])
    end
  end
end
