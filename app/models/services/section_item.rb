module Services
  class SectionItem < ActiveRecord::Base
    include OptimadminScopes

    default_scope { order(:position) }

    STYLES = ['basic'].freeze

    validates :style, inclusion: { in: STYLES }

    mount_uploader :image, Services::SectionUploader

    has_one :service, through: :section

    belongs_to :section,
                foreign_key: :services_section_id,
                counter_cache: true
  end
end
