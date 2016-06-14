class WellbeingFacade
  def articles
    @articles ||= Article.displayed.order(date: :desc).limit(4)
  end

  def body_parts
    @body_parts ||= BodyPart.displayed.order(position: :asc)
  end

  def case_studies
    @case_studies ||= CaseStudy.displayed.order(date: :desc).limit(3)
  end

  def faqs
    @faqs ||= FrequentlyAskedQuestion.displayed.order("RANDOM()").limit(6)
  end

  def video
    @video ||= Video.displayed.order(created_at: :desc).first
  end

  def people_helped_section
    @people_helped_section ||= PeopleHelpedSection.displayed.find_by(section: "Wellbeing Zone")
  end

  def team_members
    @team_members ||= TeamMember.displayed.order("RANDOM()").limit(18)
  end

  def testimonials
    @testimonials ||= Testimonial.displayed.order("RANDOM()").limit(8)
  end
end
