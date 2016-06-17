require "rails_helper"

describe CaseStudy, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
    it do
      case_study = build(:case_study)
      expect(case_study).to validate_uniqueness_of(:title)
    end
  end

  describe "associations" do
    it { should belong_to(:client) }
    it { should have_many(:categories_case_studies).class_name("Categories::CaseStudy") }
    it { should have_many(:categories).through(:categories_case_studies) }
  end
end
