class WellbeingZoneFacade

  def initialize(category)
    @category = category
  end

  def articles
    @articles ||= Article.for_category(category).displayed.order(date: :desc).limit(4)
  end

  def case_studies
    @case_studies ||= CaseStudy.for_category(category).displayed.order(date: :desc).limit(3)
  end

  def faqs
    @faqs ||= FrequentlyAskedQuestion.for_category(category).displayed.order("RANDOM()").limit(6)
  end

  def video
  end

  def people_helped_section
    @people_helped_section ||= PeopleHelpedSection.displayed.find_by(category: category)
  end

  def team_members
    @team_members ||= TeamMember.joins(:team_member_categories).displayed.merge(TeamMemberCategory.clinical).order("RANDOM()").limit(18)
  end

  def testimonials
    @testimonials ||= Testimonial.for_category(category).displayed.order("RANDOM()").limit(8)
  end

  private

  attr_reader :category
end
