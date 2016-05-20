class ServiceStandard < ActiveRecord::Base
  ICONS = %w( calendar clock document flexible heart map_pin stopwatch ).freeze

  validates :content, presence: true
  validates :hover_content, presence: true
  validates :icon, presence: true, inclusion: { in: ICONS }

  scope :ordered_by_position, -> { order(position: :asc) }
  scope :displayed, -> { where(display: true) }

  def icon_image
    "icons/#{ icon }.png"
  end
end
