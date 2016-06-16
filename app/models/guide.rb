class Guide < ActiveRecord::Base
  mount_uploader :image, GuideUploader
  mount_uploader :file, Optimadmin::DocumentUploader

  scope :displayed, -> { where(display: true) }

  has_many :categories_guides, class_name: "Categories::Guide"
  has_many :categories, through: :categories_guides

  validates :title, presence: true
  validates :file, presence: true
end
