class BannerPresenter < BasePresenter
  presents :banner
  delegate :id, to: :banner
  delegate :title, to: :banner, prefix: true
  delegate :summary, to: :banner, prefix: true
  delegate :link, to: :banner, prefix: true

  def title
    h.content_tag :h1, banner_title
  end

  def summary
    return nil unless banner_summary
    h.simple_format banner_summary
  end

  def link(options = {})
    return nil unless banner_link.present?
    h.link_to 'Read More', banner_link, options
  end
end
