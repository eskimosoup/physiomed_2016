# frozen_string_literal: true

class Service < ActiveRecord::Base
  include OptimadminScopes

  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged history]

  default_scope { order(:position) }

  STYLES = ['basic'].freeze
  LAYOUTS = ['application'].freeze
  # TODO: Add pyramid colours
  COLOURS = ['#000'].freeze

  validates :title, presence: true
  validates :style, inclusion: { in: STYLES }
  validates :layout, inclusion: { in: LAYOUTS }
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  mount_uploader :image, ServiceUploader

  has_many :sections, class_name: '::Services::Section', dependent: :destroy

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
