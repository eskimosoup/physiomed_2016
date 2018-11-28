module Services
  class CategorySectionItem < ActiveRecord::Base
    include OptimadminScopes

    belongs_to :category_section,
              foreign_key: :services_category_section

    STYLES = ['introductary_triangle'].freeze

    validates :style, inclusion: { in: STYLES }

    mount_uploader :image, Services::SectionItemUploader
  end
end
