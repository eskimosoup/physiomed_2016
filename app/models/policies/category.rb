# frozen_string_literal: true

# == Schema Information
#
# Table name: policies_categories
#
#  id              :integer          not null, primary key
#  position        :integer          default(0), not null
#  title           :string           not null
#  documents_count :integer          default(0)
#  display         :boolean          default(TRUE)
#  suggested_url   :string
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


module Policies
  class Category < ActiveRecord::Base
    include OptimadminScopes

    extend FriendlyId
    friendly_id :slug_candidates, use: %i[slugged history]

    default_scope { order(:position) }

    validates :title, presence: true

    scope :displayed, -> { where(display: true) }

    has_many :documents,
             dependent: :destroy,
             foreign_key: :policies_category_id

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
