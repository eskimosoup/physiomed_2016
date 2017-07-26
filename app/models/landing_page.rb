class LandingPage < ActiveRecord::Base
  include OptimadminScopes
  # include Presentable
  # include DisplayStatus

  default_scope { order(title: :asc) }

  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged history]

  mount_uploader :image, LandingPageUploader

  STYLE = %w[cquin].freeze
  LAYOUT = %w[application].freeze

  validates :title, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }
  validates :style, inclusion: { in: STYLE }
  validates :layout, inclusion: { in: LAYOUT }

  scope :displayed, (-> { where(display: true) })

  has_many :landing_pages_articles,
           class_name: 'LandingPages::Article',
           dependent: :destroy
  has_many :articles,
           through: :landing_pages_articles

  has_many :landing_pages_case_studies,
           class_name: 'LandingPages::CaseStudy',
           dependent: :destroy
  has_many :case_studies,
           through: :landing_pages_case_studies

  has_many :landing_pages_frequently_asked_questions,
           class_name: 'LandingPages::FrequentlyAskedQuestion',
           dependent: :destroy
  has_many :frequently_asked_questions,
           through: :landing_pages_frequently_asked_questions

  has_many :landing_pages_guides,
           class_name: 'LandingPages::Guide',
           dependent: :destroy
  has_many :guides,
           through: :landing_pages_guides

  has_many :landing_pages_testimonials,
           class_name: 'LandingPages::Testimonial',
           dependent: :destroy
  has_many :testimonials,
           through: :landing_pages_testimonials

  has_many :landing_pages_videos,
           class_name: 'LandingPages::Video',
           dependent: :destroy
  has_many :videos,
           through: :landing_pages_videos

  has_many :landing_pages_service_standards,
           class_name: 'LandingPages::ServiceStandard',
           dependent: :destroy
  has_many :service_standards,
           through: :landing_pages_service_standards

  has_many :sections,
           class_name: 'LandingPages::Section',
           dependent: :destroy

  def slug_candidates
    [
      :suggested_url,
      :title,
      %i[suggested_url title]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end
end
