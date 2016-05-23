class WellbeingFacade
  def articles
    @articles ||= Article.displayed.order(date: :desc).limit(4)
  end

  def body_parts
    @body_parts ||= BodyPart.ordered_by_position.displayed
  end

  def case_studies
    @case_studies ||= CaseStudy.order(date: :desc).displayed.limit(3)
  end

  def faqs
    @faqs ||= FrequentlyAskedQuestion.order(position: :asc).displayed.limit(6)
  end

  def people_helped
    return nil if people_helped_section.nil?
    yield people_helped_section if block_given?
    people_helped_section
  end

  def team_members
    @team_members ||= TeamMember.displayed.limit(18)
  end

  def testimonials
    @testimonials ||= Testimonial.displayed.limit(8)
  end

  private

  def people_helped_section
    @people_helped_section ||= PeopleHelpedSection.find_by(section: "Wellbeing Zone")
  end
end
