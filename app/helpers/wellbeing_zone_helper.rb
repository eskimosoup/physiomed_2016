module WellbeingZoneHelper
  def wellbeing_article_partial_path(index)
    if index.zero?
      "articles/main_wellbeing_article"
    else
      "articles/supplementary_wellbeing_article"
    end
  end

  def wellbeing_case_study_partial_path(index)
    if index.zero?
      "case_studies/main_wellbeing_case_study"
    else
      "case_studies/supplementary_wellbeing_case_study"
    end
  end
end
