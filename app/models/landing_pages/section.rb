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

    STYLES = [
      'basic',
      'choice_cta',
      'cta_points',
      'banner_cta',
      'banner_cta_link',
      'banner',
      'banner_introduction',
      'banner_introduction__testimonial',
      'service_icons',
      'service_icons__process',
      'service_icons__video',
      'service_overview',
      'service_overview__column',
      'service_timeline',
      'service_timeline__column',
      'testimonials',
      'content_overview',
      'organisations',
      'team_members',
      'team_members__member',
      'frequently_asked_questions',
      'sign_up',
      'sign_up__column'
    ].freeze

    validates :landing_page, presence: true
    # validates :content, presence: true
    # validates :title, presence: true
    validates :style, inclusion: { in: STYLES }
    validates :button_link, presence: true, if: :button_text?
    validates :button_text, presence: true, if: :button_link?

    #
    # Check if button
    #
    # @return [boolean]
    #
    def button?
      button_link? && button_text?
    end
  end
end
