class Guide < ActiveRecord::Base
  mount_uploader :image, GuideUploader
  mount_uploader :file, Optimadmin::DocumentUploader

  scope :displayed, -> { where(display: true) }
  scope :without_video, -> { where(video_id: nil) }
  scope :for_category, ->(category) { joins(:categories_guides).where(categories_guides: { category_id: category }) }

  belongs_to :video
  has_many :categories_guides, class_name: "Categories::Guide"
  has_many :categories, through: :categories_guides
  has_many :downloads, class_name: 'GuideDownload', dependent: :destroy

  has_many :articles_guides, class_name: 'Articles::Guide'
  has_many :articles, through: :articles_guides

  validates :title, presence: true
  validates :file, presence: true

end
