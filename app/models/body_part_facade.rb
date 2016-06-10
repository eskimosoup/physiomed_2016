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

  def articles
    @articles ||= Article.displayed.order(date: :desc).limit(3)
  end

  def case_studies
    @case_studies ||= CaseStudy.order(date: :desc).displayed.limit(3)
  end

  def faqs
    @faqs ||= FrequentlyAskedQuestion.order("RANDOM()").displayed.limit(6)
  end

  private

  attr_reader :body_part
end

