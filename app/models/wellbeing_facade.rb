class WellbeingFacade
  def body_parts
    @body_parts ||= BodyPart.ordered_by_position.displayed
  end

  def team_members
    @team_members ||= TeamMember.displayed.limit(18)
  end
end
