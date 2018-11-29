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

    # validates :style, inclusion: { in: STYLES }

    has_many :items,
             class_name: '::Services::CategorySectionItem',
             dependent: :destroy,
             foreign_key: :services_category_section_id

    mount_uploader :image, Services::CategorySectionUploader
  end
end
