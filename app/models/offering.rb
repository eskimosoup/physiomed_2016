class Offering < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order(:position) }

  validates :title, presence: true
  validates :link, presence: true

  scope :displayed, -> { where(display: true) }
end
