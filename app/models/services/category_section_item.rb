module Services
  class CategorySectionItem < ActiveRecord::Base
    include OptimadminScopes

    # default_scope { order(:position) }

    belongs_to :category_section,
              foreign_key: :services_category_section

    # validates :style, inclusion: { in: STYLES }

    scope :displayed, -> { where(display: true) }

    mount_uploader :image, Services::SectionItemUploader
  end
end
