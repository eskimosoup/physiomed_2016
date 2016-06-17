class Video < ActiveRecord::Base

  validates :title, presence: true
  validates :youtube_identifier, presence: true

  scope :ordered_by_title, -> { order(title: :asc) }
  scope :displayed, -> { where(display: true) }

  has_many :categories_videos, class_name: "Categories::Video"
  has_many :categories, through: :categories_videos
end
