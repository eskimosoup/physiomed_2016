# == Schema Information
#
# Table name: services_category_sections
#
#  id                   :integer          not null, primary key
#  services_category_id :integer
#  position             :integer          default(0)
#  title                :string
#  content              :text
#  image                :string
#  display              :boolean          default(TRUE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

module Services
  class CategorySection < ActiveRecord::Base
    include OptimadminScopes

    belongs_to :category, foreign_key: :services_category_id
    delegate :colour, to: :category, prefix: true

    scope :displayed, -> { where(display: true) }

    STYLES = [
      ['Introductary triangle', 'introductary_triangle'],
      ['Itemised triangle with images', 'itemised_triangle_images'],
      ['Abstract lines background with items', 'abstract_lines_background_with_items'],
      ['Days overview', 'days_overview'],
      ['Content items split with service colour (1 white, 1 service colour)', 'content_items_service_colour_split'],
      ['Content items with background image and timeframes', 'content_items_background_image'],
      ['Informative with icon (e.g. referral guidance)', 'informative_with_icon'],
      ['Affiliates', 'affiliates'],
      ['Clients', 'clients'],
      ['Tesitmonials', 'testimonials'],
    ].freeze

    # validates :style, inclusion: { in: STYLES }

    has_many :items,
             class_name: '::Services::CategorySectionItem',
             dependent: :destroy,
             foreign_key: :services_category_section_id

    mount_uploader :image, Services::CategorySectionUploader
  end
end
