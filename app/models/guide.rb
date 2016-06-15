class Guide < ActiveRecord::Base
  mount_uploader :image, GuideUploader
  mount_uploader :file, Optimadmin::DocumentUploader

  scope :displayed, -> { where(display: true) }

  validates :title, presence: true
  validates :file, presence: true
end
