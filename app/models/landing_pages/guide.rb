# == Schema Information
#
# Table name: landing_pages_guides
#
#  id              :integer          not null, primary key
#  guide_id        :integer
#  landing_page_id :integer
#  display         :boolean          default(TRUE), not null
#  position        :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

module LandingPages
  class Guide < ActiveRecord::Base
    default_scope { positioned }

    belongs_to :guide, class_name: '::Guide'
    belongs_to :landing_page

    delegate :title, to: :guide, prefix: true, allow_nil: true

    scope :positioned, -> { order(:position) }
  end
end
