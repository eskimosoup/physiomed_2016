# == Schema Information
#
# Table name: quick_links
#
#  id         :integer          not null, primary key
#  link       :string           not null
#  link_text  :string           not null
#  position   :integer          default(0), not null
#  display    :boolean          default(TRUE), not null
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class QuickLink < ActiveRecord::Base
  validates :link, presence: true
  validates :link_text, presence: true

  scope :displayed, -> { where(display: true) }
  scope :ordered_by_position, -> { order(position: :asc) }

  def employer?
    type == "EmployerQuickLink"
  end

  def employee?
    type == "EmployeeQuickLink"
  end
end
