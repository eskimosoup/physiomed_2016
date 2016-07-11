require "rails_helper"

RSpec.describe WellbeingZoneHelper, type: :helper do
  describe "#wellbeing_article_partial_path" do
    it "first article" do
      path = "articles/main_wellbeing_article"

      expect(helper.wellbeing_article_partial_path(0)).to eq(path)
    end

    it "other articles" do
      path = "articles/supplementary_wellbeing_article"

      expect(helper.wellbeing_article_partial_path(1)).to eq(path)
    end
  end

  describe "#wellbeing_case_study_partial_path" do
    it "first case study" do
      path = "case_studies/main_wellbeing_case_study"

      expect(helper.wellbeing_case_study_partial_path(0)).to eq(path)
    end

    it "other case studies" do
      path = "case_studies/supplementary_wellbeing_case_study"

      expect(helper.wellbeing_case_study_partial_path(1)).to eq(path)
    end
  end
end
