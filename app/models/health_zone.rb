class HealthZone < ActiveRecord::Base
  mount_uploader :home_image, HealthZoneHomeUploader
  mount_uploader :image, HealthZoneUploader

  validates :home_image, presence: true
  validates :hover_text, presence: true
  validates :link, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true

  scope :ordered_by_position, -> { order(position: :asc) }
  scope :displayed, -> { where(display: true) }
end
