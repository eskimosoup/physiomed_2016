class GeneralWellbeingFacade < WellbeingZoneFacade
  delegate :content, to: :category, allow_nil: true

  def general_wellbeing_categorisation
    @general_wellbeing_categorisation ||= Subcategory.displayed.find(4)
  rescue
    nil
  end

  def guides
    @guides ||= Guide.for_category(category).displayed
  end

  def articles
    @articles ||= Article.for_category(category).displayed.order(date: :desc)
  end

  def body_parts
    @body_parts ||= BodyPart.includes(:category)
  end
end
