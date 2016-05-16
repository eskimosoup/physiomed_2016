class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  include OptimadminScopes

  mount_uploader :image, ArticleUploader

  scope :displayed, -> { where(display: true) }
  scope :home, -> { where(home_highlight: true) }

  belongs_to :author, class_name: "TeamMember"

  validates :content, presence: true
  validates :date, presence: true
  validates :summary, presence: true
  validates :title, presence: true, uniqueness: true

end
