class BodyPartFacade

  delegate :name, :summary, to: :body_part

  def initialize(body_part)
    @body_part = body_part
  end

  def body_part_sections
    @body_part_sections ||= body_part.body_part_sections.displayed.order(position: :asc)
  end

  private

  attr_reader :body_part
end

