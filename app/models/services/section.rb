# == Schema Information
#
# Table name: services_sections
#
#  id                  :integer          not null, primary key
#  service_id          :integer
#  position            :integer          default(0), not null
#  title               :string
#  content             :text
#  image               :string
#  style               :string
#  display             :boolean          default(TRUE)
#  section_items_count :integer          default(0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  subtitle            :string
#  button_link         :string
#  button_text         :string
#

module Services
  class Section < ActiveRecord::Base
    include OptimadminScopes

    default_scope { order(:position) }

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
