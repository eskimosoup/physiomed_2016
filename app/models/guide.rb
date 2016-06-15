class Guide < ActiveRecord::Base
  mount_uploader :image, GuideUploader
  mount_uploader :file, Optimadmin::DocumentUploader

  validates :title, presence: true
  validates :file, presence: true
end
