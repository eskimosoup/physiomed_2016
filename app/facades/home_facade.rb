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

end
