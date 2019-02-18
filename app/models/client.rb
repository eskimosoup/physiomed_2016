# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  logo       :string           not null
#  slug       :string
#  position   :integer          default(0), not null
#  display    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  mount_uploader :logo, ClientUploader

  scope :ordered_by_name, ->{ order(name: :asc) }
  scope :displayed, ->{ where(display: true) }
  scope :ordered_by_position, ->{ order(position: :asc) }

  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true

end
