# == Schema Information
#
# Table name: additional_contents
#
#  id         :integer          not null, primary key
#  area       :string
#  title      :string
#  content    :text
#  display    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AdditionalContent < ActiveRecord::Base
   include OptimadminScopes

  default_scope { order(title: :asc) }

  AREAS = %w[
    error_404 error_422 error_400 error_500 error_403 home_pal_video
    pyramid_introduction notice_bar notice_modal
  ].freeze

  validates :area, inclusion: { in: AREAS }

  scope :displayed, (-> { where(display: true) })

  def button?
    button_link? && button_text?
  end
end
