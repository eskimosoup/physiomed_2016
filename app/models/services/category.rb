# frozen_string_literal: true
# == Schema Information
#
# Table name: services_categories
#
#  id                 :integer          not null, primary key
#  position           :integer          default(0), not null
#  parent_id          :integer
#  colour             :string
#  title              :string           not null
#  summary            :text
#  content            :text
#  display            :boolean          default(TRUE)
#  style              :string           default("basic")
#  suggested_url      :string
#  slug               :string           not null
#  homepage_highlight :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

module Services
  class Category < ActiveRecord::Base
    include OptimadminScopes

    # TODO: Add search partial
    # include PgSearch
    # multisearchable against: %i[title content], if: :display?

    extend FriendlyId
    friendly_id :slug_candidates, use: %i[slugged history]

    has_closure_tree name_column: 'title'

    default_scope { order(:position) }

    scope :displayed, -> { where(display: true) }
    scope :homepage_highlight, -> { where(homepage_highlight: true) }

    COLOURS = [
      ['Black offset', 'black--offset'],
      ['Orange', 'orange'],
      ['Green', 'green']
    ].freeze

    STYLES = ['basic', 'content_blocks'].freeze

    validates :title, presence: true
    validates :style, inclusion: { in: STYLES }
    validates :colour, presence: true
    validates :suggested_url, allow_blank: true, uniqueness: {
      case_sensitive: false,
      message: 'is already taken, leave blank to generate automatically'
    }

    has_many :sections,
             foreign_key: :services_category_id,
             class_name: '::Services::CategorySection',
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
end
