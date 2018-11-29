# frozen_string_literal: true
# == Schema Information
#
# Table name: services
#
#  id             :integer          not null, primary key
#  position       :integer          default(0)
#  title          :string           not null
#  colour         :string
#  summary        :text
#  content        :text
#  image          :string
#  display        :boolean          default(TRUE)
#  slug           :string           not null
#  suggested_url  :string
#  style          :string           default("basic"), not null
#  layout         :string           default("application"), not null
#  sections_count :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Service < ActiveRecord::Base
  include OptimadminScopes

  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged history]

  include PgSearch
  multisearchable against: [:title, :summary, :content], if: :display?

  default_scope { order(:position) }

  STYLES = ['basic'].freeze
  LAYOUTS = %w[application redesign].freeze
  # TODO: Add pyramid colours
  COLOURS = [
    ['Purple dark', 'purple--dark'],
    ['Blue regular', 'blue--regular'],
    ['Green light', 'green--light'],
    ['Blue dark', 'blue--dark'],
    ['Green pastel', 'green--pastel'],
    ['Lilac', 'lilac'],
    ['Blue slate', 'blue--slate'],
    ['Blue light', 'blue--light'],
  ].freeze

  validates :title, presence: true
  validates :style, inclusion: { in: STYLES }
  validates :layout, inclusion: { in: LAYOUTS }
  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  mount_uploader :image, ServiceUploader

  has_many :sections, class_name: '::Services::Section', dependent: :destroy

  scope :displayed, -> { where(display: true) }

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
