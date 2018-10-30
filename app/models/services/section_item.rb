module Services
  class SectionItem < ActiveRecord::Base
    include OptimadminScopes

    default_scope { order(:position) }

    STYLES = [
      ['Triangle CTA with image', 'triangle_cta_with_image'],
      ['Abstract CTA points', 'abstract_cta_points'],
    ].freeze

    # validates :style, inclusion: { in: STYLES }

    scope :displayed, -> { where(display: true) }

    mount_uploader :image, Services::SectionItemUploader

    has_one :service, through: :section

    belongs_to :section,
                foreign_key: :services_section_id,
                counter_cache: true
  end
end
