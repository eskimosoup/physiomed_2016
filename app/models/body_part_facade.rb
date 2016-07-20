class BodyPartFacade
  attr_reader :body_part
  delegate :name, :summary, to: :body_part

  def initialize(body_part)
    @body_part = body_part
  end

  def general_wellbeing_categorisation
    @general_wellbeing_categorisation ||= Subcategory.displayed.find(4)
  end

  def other_body_parts
    @other_body_parts = BodyPart.displayed.joins(:category).where.not(id: body_part.id).order('categories.name').includes(:category)
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
    @faqs ||= body_part.frequently_asked_questions.displayed.order(:position).limit(6)
  end

  def guides
    @guides ||= body_part.guides.without_video.displayed
  end

  def team_members
    @team_members ||= TeamMember.joins(:team_member_categories)
                                .merge(TeamMemberCategory.clinical).order('RANDOM()').displayed.limit(12)
  end

  def testimonials
    @testimonials ||= body_part.testimonials.displayed.order('RANDOM()').limit(8)
  end

  def video
    @video ||= body_part.videos.without_guide.displayed.order(created_at: :desc).first
  end

  def videos_with_guides
    @videos_with_guides ||= body_part.videos.displayed.joins(:guide).merge(Guide.displayed).preload(:guide)
  end
end
