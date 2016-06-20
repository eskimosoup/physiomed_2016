class Video < ActiveRecord::Base

  validates :title, presence: true
  validates :youtube_identifier, presence: true

  scope :displayed, -> { where(display: true) }
  scope :for_category, ->(category) { joins(:categories_videos).where(categories_videos: { category_id: category }) }

  has_many :categories_videos, class_name: "Categories::Video"
  has_many :categories, through: :categories_videos
end
