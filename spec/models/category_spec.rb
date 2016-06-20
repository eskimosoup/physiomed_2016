require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it do
      category = create(:category)

      expect(category).to validate_uniqueness_of :name
    end
    it { should validate_presence_of :name }
    it { should validate_inclusion_of(:name).in_array(Category::NAMES) }
  end

  describe 'associations' do
    it { should have_one(:body_part) }
    it { should have_one(:people_helped_section) }
    it { should have_many(:categories_articles).class_name("Categories::Article") }
    it { should have_many(:articles).through(:categories_articles) }
    it { should have_many(:categories_case_studies).class_name("Categories::CaseStudy") }
    it { should have_many(:case_studies).through(:categories_case_studies) }
    it { should have_many(:categories_frequently_asked_questions) }
    it { should have_many(:frequently_asked_questions).through(:categories_frequently_asked_questions) }
    it { should have_many(:categories_guides).class_name("Categories::Guide") }
    it { should have_many(:guides).through(:categories_guides) }
    it { should have_many(:categories_testimonials).class_name("Categories::Testimonial") }
    it { should have_many(:testimonials).through(:categories_testimonials) }
    it { should have_many(:categories_videos).class_name("Categories::Video") }
    it { should have_many(:videos).through(:categories_videos) }
  end
end
