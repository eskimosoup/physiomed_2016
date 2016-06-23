require "rails_helper"

RSpec.describe BodyPartFacade do
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

  it '#other_body_parts' do
    correct_category = create(:category, name: "Ankle")
    body_part = create(:body_part, category: correct_category)
    incorrect_category = create(:category, name: "Knee")
    other_body_part = create(:body_part, category: incorrect_category)
    facade = build_facade(body_part: body_part)

    expect(facade.other_body_parts).not_to include(body_part)
    expect(facade.other_body_parts).to include(other_body_part)
  end

  describe '#videos_with_guides' do
    it 'gets videos that are displayed with guides that are displayed' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      displayed = create_video_with_guide(
        display_video: true, display_guide: true, category: category)
      not_displayed_video = create_video_with_guide(
        display_video: false, display_guide: true, category: category)
      not_displayed_guide = create_video_with_guide(
        display_video: true, display_guide: false, category: category)
      facade = build_facade(body_part: body_part)

      expect(facade.videos_with_guides).to include(displayed)
      expect(facade.videos_with_guides).not_to include(not_displayed_video)
      expect(facade.videos_with_guides).not_to include(not_displayed_guide)
    end

    it 'does not get videos without guides' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      displayed = create_video_with_guide(display_video: true, 
                                          display_guide: true, category: category)
      not_displayed = create(:video, display: true, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.videos_with_guides).to include(displayed)
      expect(facade.videos_with_guides).not_to include(not_displayed)
    end

    def create_video_with_guide(display_video:, display_guide:, category:)
      video = create(:video, display: display_video, categories: [category])
      create(:guide, display: display_guide, video: video)
      video
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
    it 'gets articles belonging to the articles category' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      article = create(:article, display: true, categories: [category])
      not_category_article = create(:article, display: true)
      facade = build_facade(body_part: body_part)

      expect(facade.articles).to include(article)
      expect(facade.articles).not_to include(not_category_article)
    end

    it 'only gets 4 articles' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      create_list(:article, 4, display: true, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.articles.size).to eq(3)
    end

    it 'only get displayed articles' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      article = create(:article, display: true, categories: [category])
      not_displayed = create(:article, display: false, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.articles).to include(article)
      expect(facade.articles).not_to include(not_displayed)
    end

    it 'ordered by descending date' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      articles = [
        create(:article, display: true, date: Date.today, categories: [category]),
        create(:article, display: true, date: Date.yesterday, categories: [category]),
      ]
      facade = build_facade(body_part: body_part)

      expect(facade.articles).to eq(articles)
    end
  end

  describe "#case_studies" do
    it 'only gets case studies belonging to body parts category' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      case_study = create(:case_study, display: true, categories: [category])
      other_category_case_study = create(:case_study, display: true)
      facade = build_facade(body_part: body_part)

      expect(facade.case_studies).to include(case_study)
      expect(facade.case_studies).not_to include(other_category_case_study)
    end

    it 'orders by descending date' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      case_studies = [
        create(:case_study, display: true, date: Date.today, categories: [category]),
        create(:case_study, display: true, date: Date.yesterday, categories: [category]),
      ]
      facade = build_facade(body_part: body_part)

      expect(facade.case_studies).to eq(case_studies)
    end

    it 'only gets those that are displayed' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      case_study = create(:case_study, display: true, categories: [category])
      not_displayed = create(:case_study, display: false, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.case_studies).to include(case_study)
      expect(facade.case_studies).not_to include(not_displayed)
    end

    it 'only gets three' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      create_list(:case_study, 4, display: true, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.case_studies.size).to eq(3)
    end
  end

  describe '#faqs' do
    it 'only gets faqs belonging to body parts category' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      faq = create(:frequently_asked_question, display: true, categories: [category])
      other_category_faq = create(:frequently_asked_question, display: true)
      facade = build_facade(body_part: body_part)

      expect(facade.faqs).to include(faq)
      expect(facade.faqs).not_to include(other_category_faq)
    end

    it 'only gets displayed faqs' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      faq = create(:frequently_asked_question, display: true, categories: [category])
      not_displayed = create(:frequently_asked_question, display: false, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.faqs).to include(faq)
      expect(facade.faqs).not_to include(not_displayed)
    end

    it 'only gets six' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      create_list(:frequently_asked_question, 7, display: true, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.faqs.size).to eq(6)
    end
  end

  describe '#testimonials' do
    it 'gets testimonials through category' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      testimonial = create(:testimonial, display: true, categories: [category])
      no_category_testimonial = create(:testimonial, display: true)
      facade = build_facade(body_part: body_part)

      expect(facade.testimonials).to include(testimonial)
      expect(facade.testimonials).not_to include(no_category_testimonial)
    end

    it 'gets displayed testimonials' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      testimonial = create(:testimonial, display: true, categories: [category])
      not_displayed = create(:testimonial, display: false, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.testimonials).to include(testimonial)
      expect(facade.testimonials).not_to include(not_displayed)
    end

    it 'only gets 8' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      create_list(:testimonial, 9, display: true, categories: [category])
      facade = build_facade(body_part: body_part)

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
    it 'gets videos without guides' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      video = create(:video, display: true, categories: [category])
      video_with_guide = create(:video, display: true, categories: [category])
      guide = create(:guide, video: video_with_guide)
      facade = build_facade(body_part: body_part)

      expect(facade.video).to eq(video)
      expect(facade.video).not_to eq(video_with_guide)
    end

    it 'gets videos through category' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      video = create(:video, display: true, categories: [category])
      no_category_video = create(:video, display: true)
      facade = build_facade(body_part: body_part)

      expect(facade.video).to eq(video)
      expect(facade.video).not_to eq(no_category_video)
    end

    it 'gets displayed video' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      video = create(:video, display: true, categories: [category])
      not_displayed = create(:video, display: false, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.video).to eq(video)
      expect(facade.video).not_to eq(not_displayed)
    end
  end

  describe '#guides' do
    it 'gets guides through category' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      guide = create(:guide, display: true, categories: [category])
      no_category_guide = create(:guide, display: true)
      facade = build_facade(body_part: body_part)

      expect(facade.guides).to include(guide)
      expect(facade.guides).not_to include(no_category_guide)
    end

    it 'gets guides without videos' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      video = create(:video)
      guide = create(:guide, display: true, categories: [category])
      with_video = create(:guide, display: true, categories: [category], video: video)
      facade = build_facade(body_part: body_part)

      expect(facade.guides).to include(guide)
      expect(facade.guides).not_to include(with_video)
    end

    it 'gets displayed guides' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      guide = create(:guide, display: true, categories: [category])
      not_displayed = create(:guide, display: false, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.guides).to include(guide)
      expect(facade.guides).not_to include(not_displayed)
    end

    it 'only gets two guides' do
      category = create(:category, name: "Ankle")
      body_part = create(:body_part, category: category)
      create_list(:guide, 3, display: true, categories: [category])
      facade = build_facade(body_part: body_part)

      expect(facade.guides.size).to eq(2)
    end
  end

  def build_facade(body_part: nil)
    BodyPartFacade.new(body_part)
  end
end
