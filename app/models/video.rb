class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :youtube_identifier, presence: true

  scope :ordered_by_title, -> { order(title: :asc) }
  scope :displayed, -> { where(display: true) }
end
