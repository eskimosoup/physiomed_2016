# == Schema Information
#
# Table name: client_zone_services
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  summary    :text             not null
#  file       :string           not null
#  image      :string
#  display    :boolean          default(TRUE)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
