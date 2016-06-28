class WellbeingFacade < WellbeingZoneFacade
  def body_parts
    @body_parts ||= BodyPart.displayed.order(position: :asc)
  end
end
