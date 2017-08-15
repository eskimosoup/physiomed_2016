module LandingPages
  class Guide < ActiveRecord::Base
    default_scope { positioned }

    belongs_to :guide, class_name: '::Guide'
    belongs_to :landing_page

    delegate :title, to: :guide, prefix: true, allow_nil: true

    scope :positioned, -> { order(:position) }
  end
end
