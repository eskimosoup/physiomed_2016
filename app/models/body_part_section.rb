class BodyPartSection < ActiveRecord::Base
  mount_uploader :image, BodyPartSectionUploader

  belongs_to :body_part, counter_cache: true

  scope :displayed, -> { where(display: true) }

  validates :body_part, presence: true
  validates :content, presence: true
  validates :title, presence: true
  
end
