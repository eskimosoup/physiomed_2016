# == Schema Information
#
# Table name: services_section_items
#
#  id                  :integer          not null, primary key
#  services_section_id :integer
#  position            :integer          default(0), not null
#  title               :string
#  content             :text
#  image               :string
#  style               :string           default("basic"), not null
#  display             :boolean          default(TRUE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  subtitle            :string
#  button_text         :string
#  button_link         :string
#

module Services
  class SectionItem < ActiveRecord::Base
    include OptimadminScopes

    default_scope { order(:position) }

    STYLES = [
      ['Triangle CTA with image', 'triangle_cta_with_image'],
      ['Triangle CTA with title (top triangle)', 'triangle_cta_with_title'],
      ['Abstract CTA points', 'abstract_cta_points'],
      ['Basic', 'basic'],
      ['Service colour', 'service_colour'],
      ['CTA list - service colour', 'cta_list_service_colour'],
      ['CTA list - white', 'cta_list_white']
      ['CTA list - white 12 cols', 'cta_list_white_12_cols']
    ].freeze

    # validates :style, inclusion: { in: STYLES }

    scope :displayed, -> { where(display: true) }

    mount_uploader :image, Services::SectionItemUploader

    has_one :service, through: :section

    validates :button_link, presence: true, if: :button_text?
    validates :button_text, presence: true, if: :button_link?

    belongs_to :section,
                foreign_key: :services_section_id,
                counter_cache: true
  end
end
