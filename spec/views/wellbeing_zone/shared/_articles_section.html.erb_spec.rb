require 'rails_helper'

RSpec.describe 'wellbeing_zone/shared/_articles_section.html.erb' do
  context 'with articles' do
    it 'renders the articles container' do
      articles = build_stubbed_list(:article, 2)

      render "wellbeing_zone/shared/articles_section", articles: articles

      expect(rendered).to have_css ".articles-container"
    end
  end

  it 'renders nothing' do
    render "wellbeing_zone/shared/articles_section", articles: []

    expect(rendered).to be_blank
  end
end
