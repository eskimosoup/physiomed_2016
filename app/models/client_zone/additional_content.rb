module ClientZone
  class AdditionalContent < ActiveRecord::Base
    require_dependency 'client_zone'

    include OptimadminScopes

    AREAS = %w(services videos client_zone_home).freeze

    validates :area,
              presence: true,
              uniqueness: true,
              inclusion: { in: AREAS }

    scope :displayed, -> { where(display: true) }
  end
end
