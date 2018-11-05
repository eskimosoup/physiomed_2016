# frozen_string_literal: true

# == Schema Information
#
# Table name: landing_pages_sections
#
#  id              :integer          not null, primary key
#  landing_page_id :integer
#  title           :string           not null
#  sub_title       :string
#  content         :text
#  image           :string
#  position        :integer          default(0), not null
#  display         :boolean          default(TRUE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  style           :string           default("basic"), not null
#


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
