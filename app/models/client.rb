class Client < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  mount_uploader :logo, ClientUploader

  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true

  scope :ordered_by_name, ->{ order(name: :asc) }

end
