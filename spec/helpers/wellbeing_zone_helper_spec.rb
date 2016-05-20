require "rails_helper"

describe WellbeingZoneHelper, type: :helper do
  describe "#wellbeing_article_partial" do
    it "first article" do
      article = Article.new

      rendering = render(
        partial: "articles/main_wellbeing_article",
        locals: { article: article })

      expect(helper.wellbeing_article_partial(article, 0)).to eq(rendering)
    end

    it "other articles" do
      article = Article.new

      rendering = render(
        partial: "articles/supplementary_wellbeing_article",
        locals: { article: article })

      expect(helper.wellbeing_article_partial(article, 1)).to eq(rendering)
    end
  end
end
