class Banner < ActiveRecord::Base
  mount_uploader :image, BannerUploader

  validates :title, presence: true
  validates :image, presence: true
  validate :image_width

  scope :displayed, -> { where(display: true) }
  scope :ordered_by_position, -> { order(position: :asc) }

  def self.presenter
    BannerPresenter
  end

  private

  def image_width
    return if image_cache.nil?
    errors.add(:image, "is less than 1200 pixels wide") if image.width < 1200
  end
end
