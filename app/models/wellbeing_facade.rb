class WellbeingFacade

  def initialize(category)
    @category = category
  end

  def articles
    @articles ||= category.articles.displayed.order(date: :desc).limit(4)
  end

  def body_parts
    @body_parts ||= BodyPart.displayed.order(position: :asc)
  end

  def case_studies
    @case_studies ||= category.case_studies.displayed.order(date: :desc).limit(3)
  end

  def faqs
    @faqs ||= category.frequently_asked_questions.displayed.order("RANDOM()").limit(6)
  end

  def video
    @video ||= category.videos.displayed.order(created_at: :desc).first
  end

  def people_helped_section
    @people_helped_section ||= category.people_helped_section
  end

  def team_members
    @team_members ||= TeamMember.displayed.order("RANDOM()").limit(18)
  end

  def testimonials
    @testimonials ||= category.testimonials.displayed.order("RANDOM()").limit(8)
  end

  private

  attr_reader :category
end
