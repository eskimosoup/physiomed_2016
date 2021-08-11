# == Schema Information
#
# Table name: practices
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string
#  town       :string
#  county     :string
#  post_code  :string           not null
#  latitude   :float
#  longitude  :float
#  display    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Practice < ActiveRecord::Base
  geocoded_by :post_code
  after_validation :geocode, if: proc { post_code_changed? || latitude.blank? || longitude.blank? }

  validates :name, presence: true
  validates :post_code, presence: true

  scope :order_by, ->(order_param){ order(order_param || "name asc") }
  scope :search, ->(keywords){ where("name ILIKE ?", "%#{ keywords }%") if keywords.present? }
  scope :displayed, ->{ where(display: true) }
end
