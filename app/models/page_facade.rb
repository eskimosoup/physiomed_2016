class PageFacade

  attr_reader :page

  delegate :layout, :title, to: :page

  def initialize(page)
    @page = page
  end

  def articles
    return unless display_articles?
    @articles ||= Article.displayed.order(date: :desc).limit(2)
  end

  def case_studies
    return unless display_case_studies?
    @case_studies ||= CaseStudy.displayed.order(date: :desc).limit(2)
  end

  def style
    return 'what_we_do' if what_we_do_link.present?
    page.style
  end

  def testimonials
    @testimonials ||= page.testimonials.displayed
  end

  def what_we_dos
    @what_we_dos ||= WhatWeDo.eager_load(:displayed_links).displayed.order(position: :asc).merge(WhatWeDoLink.order(position: :asc))
  end

  def what_we_do_link
    @what_we_do_link ||= page.what_we_do_link
  end

  def side_menus
    @side_menus ||= page.side_menus
  end

  def team_members
    @team_members ||= page.team_members.displayed
  end

  def job_listings
    @job_listings = JobListing.displayed
  end

  private

  def display_articles?
    page.display_news?
  end

  def display_case_studies?
    page.display_case_studies?
  end
end
