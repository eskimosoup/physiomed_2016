require 'rails_helper'

RSpec.describe PageFacade, type: :model do

  it 'delegates layout' do
    page = build(:page)
    facade = build_facade(page)

    expect(facade).to delegate_method(:layout).to(:page)
  end

  it 'delegates title' do
    page = build(:page)
    facade = build_facade(page)

    expect(facade).to delegate_method(:title).to(:page)
  end
  
  describe '#style' do
    context 'page has what we do link' do
      it 'returns what_we_do' do
        what_we_do_link = build(:what_we_do_link)
        page = build(:page, what_we_do_link: what_we_do_link)
        facade = build_facade(page)

        expect(facade.style).to eq('what_we_do')
      end
    end

    context 'page has no what we do link' do
      it 'returns the page style' do
        page = build(:page, style: 'basic')
        facade = build_facade(page)

        expect(facade.style).to eq('basic')
      end
    end
  end

  it '#what_we_dos' do
    displayed = create(:what_we_do, display: true)
    not_displayed = create(:what_we_do, display: false)
    page = build(:page)
    facade = build_facade(page)

    what_we_dos = facade.what_we_dos

    expect(what_we_dos).to include(displayed)
    expect(what_we_dos).not_to include(not_displayed)
  end

  it '#team_members' do
    page = create(:page)
    displayed = create(:team_member, display: true, pages: [page])
    not_displayed = create(:team_member, display: false, pages: [page])
    facade = build_facade(page)

    team_members = facade.team_members

    expect(team_members).to include(displayed)
    expect(team_members).not_to include(not_displayed)
  end

  it '#testimonials' do
    page = create(:page)
    displayed = create(:testimonial, display: true, pages: [page])
    not_displayed = create(:testimonial, display: false, pages: [page])
    facade = build_facade(page)

    testimonials = facade.testimonials

    expect(testimonials).to include(displayed)
    expect(testimonials).not_to include(not_displayed)
  end

  it 'side_menus' do
    page = build(:page)
    facade = build_facade(page)

    expect(facade).to delegate_method(:side_menus).to(:page)
  end

  context 'page has articles displayed' do
    it 'returns articles' do
      article = create(:article, display: true)
      page = create(:page, display_news: true)
      facade = build_facade(page)

      expect(facade.articles).to include(article)
    end
  end

  context 'page has articles not displayed' do
    it 'returns nil' do
      article = create(:article, display: true)
      page = create(:page, display_news: false)
      facade = build_facade(page)

      expect(facade.articles).to be_nil
    end
  end

  context 'page has case_studies displayed' do
    it 'returns case_studies' do
      case_study = create(:case_study, display: true)
      page = create(:page, display_case_studies: true)
      facade = build_facade(page)

      expect(facade.case_studies).to include(case_study)
    end
  end

  context 'page has case_studies not displayed' do
    it 'returns nil' do
      case_study = create(:case_study, display: true)
      page = create(:page, display_case_studies: false)
      facade = build_facade(page)

      expect(facade.case_studies).to be_nil
    end
  end

  def build_facade(page)
    PageFacade.new(page)
  end
end
