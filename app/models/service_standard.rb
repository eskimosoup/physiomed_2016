class ServiceStandard < ActiveRecord::Base
  ICONS = %w( calendar clock document flexible heart map_pin stopwatch none ).freeze

  validates :content, presence: true
  validates :hover_content, presence: true
  validates :icon, presence: true, inclusion: { in: ICONS }
  validates :icon_text, presence: true, if: proc { |x| x.icon == 'none' }

  scope :ordered_by_position, -> { order(position: :asc) }
  scope :displayed, -> { where(display: true) }

  has_many :landing_pages_service_standards,
           class_name: 'LandingPages::ServiceStandard',
           dependent: :destroy
  has_many :landing_pages,
           through: :landing_pages_service_standards

  def icon_image
    "icons/#{ icon }.png"
  end
end
