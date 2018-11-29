module Services
  class Affiliate < ActiveRecord::Base
    include OptimadminScopes

    default_scope { order(:position) }

    scope :displayed, -> { where(display: true) }

    validates :title, presence: true

    mount_uploader :image, Services::AffiliateUploader
    mount_uploader :icon, Services::AffiliateUploader
  end
end
