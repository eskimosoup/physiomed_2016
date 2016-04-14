class HealthZonePresenter < BasePresenter
  presents :health_zone
  delegate :id, to: :health_zone
  delegate :title, to: :health_zone
  delegate :link, to: :health_zone
  delegate :hover_text, to: :health_zone, prefix: true
  delegate :content, to: :health_zone, prefix: true

  def title_link
    h.link_to title, link
  end

  def hover_text
    h.simple_format health_zone_hover_text
  end

  def content
    return nil unless health_zone_content
    h.content_tag :div, class: "content" do
      h.raw health_zone_content
    end
  end

  def read_more_link
    h.link_to "Read more", link
  end
end
