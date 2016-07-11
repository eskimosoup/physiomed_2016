module SidebarHelper
  def wellbeing_zone_health_zone
    HealthZone.displayed.find_by(link: '/well-being-zone')
  end

  def latest_articles
    @latest_articles ||= Article.displayed.order(date: :desc).limit(2)
  end

  def latest_case_studies
    @latest_case_studies ||= CaseStudy.displayed.order(date: :desc).limit(2)
  end
end
