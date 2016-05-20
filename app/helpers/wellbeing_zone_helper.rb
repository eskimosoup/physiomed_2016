module WellbeingZoneHelper
  def wellbeing_article_partial(article, index)
    partial_path = if index.zero?
                     "articles/main_wellbeing_article"
                   else
                     "articles/supplementary_wellbeing_article"
                   end
    render(partial: partial_path, locals: { article: article })
  end
end
