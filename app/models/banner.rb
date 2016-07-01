class Banner < ActiveRecord::Base
  mount_uploader :image, BannerUploader

  validates :title, presence: true
  validates :image, presence: true
  # validate :image_width

  scope :displayed, -> { where(display: true) }
  scope :ordered_by_position, -> { order(position: :asc) }

  private

  def image_width
    return if image_cache.nil?
    errors.add(:image, 'is less than 1366 pixels wide') if image.width < 1366
  end
end
