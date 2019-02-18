# == Schema Information
#
# Table name: health_zones
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image      :string
#  home_image :string           not null
#  hover_text :string           not null
#  link       :string           not null
#  position   :integer          default(0), not null
#  display    :boolean          default(TRUE), not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
