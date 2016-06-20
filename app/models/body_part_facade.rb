class BodyPartFacade
  attr_reader :body_part
  delegate :name, :summary, to: :body_part

  def initialize(body_part)
    @body_part = body_part
  end

  def body_part_sections
    @body_part_sections ||= body_part.body_part_sections
                                     .displayed.order(position: :asc)
  end

  def people_helped_section
    @people_helped_section ||= body_part.people_helped_section
  end

  def articles
    @articles ||= body_part.articles.displayed.order(date: :desc).limit(3)
  end

  def case_studies
    @case_studies ||= body_part.case_studies.displayed.order(date: :desc).limit(3)
  end

  def faqs
    @faqs ||= body_part.frequently_asked_questions.displayed.order('RANDOM()').limit(6)
  end

  def guides
    @guides ||= body_part.guides.displayed.limit(2)
  end

  def team_members
    @team_members ||= TeamMember.order('RANDOM()').displayed.limit(12)
  end

  def testimonials
    @testimonials ||= body_part.testimonials.displayed.order('RANDOM()').limit(8)
  end

  def video
    @video ||= body_part.videos.displayed.order(created_at: :desc).first
  end
end
