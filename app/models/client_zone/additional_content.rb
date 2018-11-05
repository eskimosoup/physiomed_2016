# frozen_string_literal: true

# == Schema Information
#
# Table name: client_zone_additional_contents
#
#  id         :integer          not null, primary key
#  area       :string           not null
#  title      :string
#  content    :text
#  display    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


module ClientZone
  class AdditionalContent < ActiveRecord::Base
    require_dependency 'client_zone'

    include OptimadminScopes

    AREAS = %w[
      services videos articles client_zone_home
    ].freeze

    validates :area,
              presence: true,
              uniqueness: true,
              inclusion: { in: AREAS }

    scope :displayed, -> { where(display: true) }
    end
end
