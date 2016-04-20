class HomeFacade

  def banners
    @banners ||= Banner.displayed.ordered_by_position
  end

  def employer_quick_links
    @employer_quick_links ||= quick_links.select(&:employer?)
  end

  def employee_quick_links
    @employee_quick_links ||= quick_links.select(&:employee?)
  end

  def quick_links
    @quick_links ||= QuickLink.displayed.ordered_by_position
  end

  def health_zones
    @health_zones ||= HealthZone.displayed.ordered_by_position
  end

  def additional_contents
    @additional_contents ||= AdditionalHomeContent.displayed.ordered_by_position
  end

  def service_standards
    @service_standards ||= ServiceStandard.displayed.ordered_by_position
  end

  def physio_search
    @physio_search ||= PhysioSearch.new
  end

  def case_studies
    @case_studies ||= CaseStudy.order_by(date: :desc).displayed.for_home.limit(10)
  end

  def testimonials
    @testimonials ||= Testimonial.displayed.random_order.limit(10)
  end

  def clients
    @cients ||= Client.displayed.ordered_by_position
  end
end
