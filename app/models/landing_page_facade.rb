class LandingPageFacade
  attr_reader :landing_page

  delegate :style, :layout, :title, :content, to: :landing_page

  def initialize(landing_page)
    @landing_page = landing_page
  end

  def sections
    @sections ||= landing_page.sections.displayed.order(position: :asc)
  end

  def articles
    @articles ||= landing_page.articles.displayed.order(date: :desc).limit(3)
  end

  def case_studies
    @case_studies ||= landing_page.case_studies.displayed.order(date: :desc).limit(3)
  end

  def faqs
    @faqs ||= landing_page.frequently_asked_questions.displayed.order(:position).limit(6)
  end

  def guides
    @guides ||= landing_page.guides.without_video.displayed
  end

  def team_members
    @team_members ||= TeamMember.joins(:team_member_categories)
                                .merge(TeamMemberCategory.clinical).order('RANDOM()').displayed.limit(12)
  end

  def testimonials
    @testimonials ||= landing_page.testimonials.displayed.order('RANDOM()').limit(8)
  end

  def video
    @video ||= landing_page.videos.without_guide.displayed.order(created_at: :desc).first
  end

  def additional_content
    @additional_content ||= AdditionalHomeContent.find_by(title: 'What we do')
  end

  def videos_with_guides
    @videos_with_guides ||= landing_page.videos.displayed.joins(:guide).merge(Guide.displayed).preload(:guide)
  end
end
