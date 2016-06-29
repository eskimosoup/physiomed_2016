class GeneralWellbeingFacade < WellbeingZoneFacade
  def guides
    @guides ||= Guide.for_category(category).displayed
  end

  def body_parts
    @body_parts ||= BodyPart.includes(:category)
  end
end
