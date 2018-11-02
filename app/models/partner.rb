class Partner < ActiveRecord::Base
  include OptimadminScopes

  mount_uploader :image, PartnerUploader

  validates :title, presence: true
  validates :website_url, presence: true

  scope :displayed, -> { where(display: true) }
end
