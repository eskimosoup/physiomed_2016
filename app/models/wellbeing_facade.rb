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

  def video
    @video ||= Video.order(created_at: :desc).first
  end

  def people_helped_section
    @people_helped_section ||= PeopleHelpedSection.displayed.find_by(section: "Wellbeing Zone")
  end

  def team_members
    @team_members ||= TeamMember.displayed.limit(18)
  end

  def testimonials
    @testimonials ||= Testimonial.displayed.limit(8)
  end
end
