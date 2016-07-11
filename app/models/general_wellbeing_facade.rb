class GeneralWellbeingFacade < WellbeingZoneFacade

  delegate :content, to: :category, allow_nil: true

  def guides
    @guides ||= Guide.for_category(category).displayed
  end

  def body_parts
    @body_parts ||= BodyPart.includes(:category)
  end
end
