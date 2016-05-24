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

  def video_section
    return nil if video.nil?
    yield video if block_given?
    video
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
    @people_helped_section ||= PeopleHelpedSection.displayed.find_by(section: "Wellbeing Zone")
  end

  def video
    @video ||= Video.order(created_at: :desc).first
  end
end
