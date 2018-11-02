# == Schema Information
#
# Table name: subcategories
#
#  id            :integer          not null, primary key
#  title         :string           not null
#  image         :string
#  summary       :text
#  display       :boolean          default(TRUE)
#  position      :integer          default(0), not null
#  slug          :string
#  suggested_url :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Subcategory < ActiveRecord::Base
  include OptimadminScopes

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, SubcategoryUploader

  default_scope { positioned }

  validates :title, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  has_many :subcategory_videos,
           dependent: :destroy,
           class_name: 'Subcategories::Video'
  has_many :subcategory_guides,
           dependent: :destroy,
           class_name: 'Subcategories::Guide'

  has_many :videos,
           through: :subcategory_videos
  has_many :guides,
           through: :subcategory_guides

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    if slug.blank? || suggested_url_changed? || title_changed?
      true
    else
      false
    end
  end
end
