# frozen_string_literal: true

module LandingPages
  class Section < ActiveRecord::Base
    belongs_to :landing_page, counter_cache: true

    mount_uploader :image, BodyPartSectionUploader

    scope :displayed, -> { where(display: true) }

    STYLES = %w[basic choice_cta].freeze

    validates :landing_page, presence: true
    validates :content, presence: true
    validates :title, presence: true
    validates :style, inclusion: { in: STYLES }
  end
end
