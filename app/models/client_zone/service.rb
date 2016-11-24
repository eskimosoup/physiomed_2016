module ClientZone
  class Service < ActiveRecord::Base
    require_dependency 'client_zone'

    include OptimadminScopes

    default_scope { positioned }

    mount_uploader :image, ServiceUploader
    mount_uploader :file, Optimadmin::DocumentUploader

    validates :title, :summary, :file, presence: true

    scope :positioned, -> { order(:position) }
    scope :displayed, -> { where(display: true) }
  end
end
