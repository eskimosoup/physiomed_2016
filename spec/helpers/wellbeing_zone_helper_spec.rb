require "rails_helper"

describe WellbeingZoneHelper, type: :helper do
  describe "#wellbeing_article_partial" do
    it "first article" do
      article = Article.new(date: Date.today)

      rendering = render(
        partial: "articles/main_wellbeing_article",
        locals: { article: article })

      expect(helper.wellbeing_article_partial(article, 0)).to eq(rendering)
    end

    it "other articles" do
      article = Article.new(date: Date.today)

      rendering = render(
        partial: "articles/supplementary_wellbeing_article",
        locals: { article: article })

      expect(helper.wellbeing_article_partial(article, 1)).to eq(rendering)
    end
  end

  describe "#wellbeing_case_study_partial" do
    it "first case study" do
      case_study = CaseStudy.new(date: Date.today)

      rendering = render(
        partial: "case_studies/main_wellbeing_case_study",
        locals: { case_study: case_study })

      expect(helper.wellbeing_case_study_partial(case_study, 0)).to eq(rendering)
    end

    it "other case studies" do
      case_study = CaseStudy.new(date: Date.today)

      rendering = render(
        partial: "case_studies/supplementary_wellbeing_case_study",
        locals: { case_study: case_study })

      expect(helper.wellbeing_case_study_partial(case_study, 1)).to eq(rendering)
    end
  end
end
