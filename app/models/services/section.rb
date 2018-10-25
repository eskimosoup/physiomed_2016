module Services
  class Section < ActiveRecord::Base
    include OptimadminScopes

    default_scope { order(:position) }

    STYLES = ['basic'].freeze

    validates :style, inclusion: { in: STYLES }

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
