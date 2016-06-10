class BodyPartFacade

  delegate :name, :summary, to: :body_part

  def initialize(body_part)
    @body_part = body_part
  end

  def body_part_sections
    @body_part_sections ||= body_part.body_part_sections.displayed.order(position: :asc)
  end

  def people_helped_section
    @people_helped_section ||= PeopleHelpedSection.find_by(section: name)
  end

  private

  attr_reader :body_part
end

