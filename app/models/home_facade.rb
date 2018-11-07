class HomeFacade
  def banners
    @banners ||= Banner.displayed.ordered_by_position
  end

  def affiliates
    @affiliates ||= service.sections.displayed.find_by(style: 'affiliates')
  end

  def clients
    @clients ||= service.sections.displayed.find_by(style: 'clients')
  end

  def testimonials
    @testimonials ||= service.sections.displayed.find_by(style: 'testimonials')
  end

  def service
    @service ||= services.first
  end

  def affiliates?
    affiliates.present?
  end

  def testimonials?
    testimonials.present?
  end

  def clients?
    clients.present?
  end

  def service_standards
    @service_standards ||= ServiceStandard.displayed.ordered_by_position.where.not(id: [LandingPages::ServiceStandard.pluck(:service_standard_id)])
  end

  def services
    @services ||= Service.displayed
  end

  # --- OLD
  def additional_contents
    @additional_contents ||= AdditionalHomeContent.includes(:video).displayed.ordered_by_position
  end

  def articles
    @articles ||= Article.includes(:author).displayed.home.order(date: :desc).limit(10)
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

  def case_studies
    @case_studies ||= CaseStudy.order(date: :desc).displayed.for_home.limit(10)
  end

  def job_listings
    @job_listings ||= JobListing.displayed.limit(2).order(display_until: :asc)
  end

  def pal_content
    @pal_content ||= AdditionalContent.displayed.find_by(area: 'home_pal_video')
  end
end
