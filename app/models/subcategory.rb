class Subcategory < ActiveRecord::Base
  default_scope { positioned }

  validates :title, presence: true

  has_many :subcategory_videos,
           dependent: :destroy,
           class_name: 'Subcategories::Video'

  has_many :videos,
           through: :subcategory_videos

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
