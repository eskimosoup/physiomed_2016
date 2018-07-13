class AdditionalContent < ActiveRecord::Base
   include OptimadminScopes

  default_scope { order(title: :asc) }

  AREAS = %w[
    error_404 error_422 error_400 error_500 error_403
  ].freeze

  validates :area, inclusion: { in: AREAS }

  scope :displayed, (-> { where(display: true) })
end
