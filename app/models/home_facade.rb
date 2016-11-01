class HomeFacade
  def additional_contents
    @additional_contents ||= AdditionalHomeContent.includes(:video).displayed.ordered_by_position
  end

  def articles
    @articles ||= Article.includes(:author).displayed.home.order(date: :desc).limit(10)
  end

  def banners
    @banners ||= Banner.displayed.ordered_by_position
  end

  def employee_quick_links
    @employee_quick_links ||= quick_links.select(&:employee?)
  end

  def employer_quick_links
    @employer_quick_links ||= quick_links.select(&:employer?)
  end

  def health_zones
    @health_zones ||= HealthZone.displayed.ordered_by_position
  end

  def quick_links
    @quick_links ||= QuickLink.displayed.ordered_by_position
  end

  def service_standards
    @service_standards ||= ServiceStandard.displayed.ordered_by_position
  end

  def case_studies
    @case_studies ||= CaseStudy.order(date: :desc).displayed.for_home.limit(10)
  end

  def testimonials
    @testimonials ||= Testimonial.displayed.order('RANDOM()').limit(10)
  end

  def clients
    @cients ||= Client.displayed.ordered_by_position
  end

  def job_listings
    @job_listings ||= JobListing.displayed.limit(2).order(display_until: :asc)
  end
end
