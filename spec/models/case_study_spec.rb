# == Schema Information
#
# Table name: case_studies
#
#  id             :integer          not null, primary key
#  title          :string           not null
#  image          :string
#  summary        :text             not null
#  content        :text             not null
#  date           :date             not null
#  client_id      :integer
#  display        :boolean          default(TRUE), not null
#  home_highlight :boolean          default(TRUE), not null
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require "rails_helper"

RSpec.describe CaseStudy, type: :model do
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
    it { should have_many :testimonials }
  end
end
