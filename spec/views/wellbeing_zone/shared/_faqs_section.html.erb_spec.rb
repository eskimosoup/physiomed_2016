require 'rails_helper'

RSpec.describe 'wellbeing_zone/shared/_faqs_section.html.erb' do
  context 'with faqs' do
    it 'renders the faqs section' do
      faqs = build_stubbed_list(:frequently_asked_question, 2)

      render "wellbeing_zone/shared/faqs_section", faqs: faqs

      expect(rendered).to have_css ".faqs-container"
    end
  end

  context 'without faqs' do
    it 'renders nothing' do
      render "wellbeing_zone/shared/faqs_section", faqs: []

      expect(rendered).to be_blank
    end
  end
end
