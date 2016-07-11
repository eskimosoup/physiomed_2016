class Banner < ActiveRecord::Base
  mount_uploader :image, BannerUploader

  validates :title, presence: true
  validates :image, presence: true

  scope :displayed, -> { where(display: true) }
  scope :ordered_by_position, -> { order(position: :asc) }

end
