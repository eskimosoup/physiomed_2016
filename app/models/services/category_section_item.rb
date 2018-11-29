module Services
  class CategorySectionItem < ActiveRecord::Base
    include OptimadminScopes

    # default_scope { order(:position) }

    STYLES = [
      ['Triangle CTA with image', 'triangle_cta_with_image'],
      ['Triangle CTA with title (top triangle)', 'triangle_cta_with_title'],
      ['Abstract CTA points', 'abstract_cta_points'],
      ['Basic', 'basic'],
      ['Service colour', 'service_colour'],
      ['CTA list - service colour', 'cta_list_service_colour'],
      ['CTA list - white', 'cta_list_white'],
      ['Affiliate - Star bookmark icon', 'affiliate_star_bookmark_icon'],
      ['Affiliate - NHS', 'affiliate_nhs']
    ].freeze

    belongs_to :category_section,
              foreign_key: :services_category_section

    # validates :style, inclusion: { in: STYLES }

    scope :displayed, -> { where(display: true) }

    mount_uploader :image, Services::SectionItemUploader
  end
end
