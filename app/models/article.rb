class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  include OptimadminScopes

  mount_uploader :image, ArticleUploader

  scope :displayed, -> { where(display: true) }
  scope :displayed_on_client_zone, -> { where(display_on_client_zone: true) }

  scope :home, -> { where(home_highlight: true) }
  scope :for_category, ->(category) { joins(:categories_articles).where(categories_articles: { category_id: category }) }

  belongs_to :author, class_name: 'TeamMember'
  has_many :categories_articles, class_name: 'Categories::Article'
  has_many :categories, through: :categories_articles

  has_many :articles_guides, class_name: 'Articles::Guide'
  has_many :guides, through: :articles_guides

  validates :content, presence: true
  validates :date, presence: true
  validates :summary, presence: true
  validates :title, presence: true, uniqueness: true
end
