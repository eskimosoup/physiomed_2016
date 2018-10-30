module Services
  class Section < ActiveRecord::Base
    include OptimadminScopes

    default_scope { order(:position) }

    STYLES = [
      ['Introductary triangle', 'introductary_triangle'],
      ['Itemised triangle with images', 'itemised_triangle_images'],
      ['Abstract lines background with items', 'abstract_lines_background_with_items'],
      ['Days overview', 'days_overview'],
    ].freeze

    # TODO: Validate inclusion of array
    # validates :style, inclusion: { in: STYLES }

    scope :displayed, -> { where(display: true) }

    mount_uploader :image, Services::SectionUploader

    belongs_to :service,
               counter_cache: true

    delegate :title, to: :service, prefix: true

    has_many :items,
             class_name: '::Services::SectionItem',
             dependent: :destroy,
             foreign_key: :services_section_id
  end
end
