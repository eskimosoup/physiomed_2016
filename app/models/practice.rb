class Practice < ActiveRecord::Base
  geocoded_by :post_code
  after_validation :geocode, if: :post_code_changed?

  validates :name, presence: true
  validates :post_code, presence: true

  scope :order_by, ->(order_param){ order(order_param || "name asc") }
  scope :search, ->(keywords){ where("name ILIKE ?", "%#{ keywords }%") if keywords.present? }
  scope :displayed, ->{ where(display: true) }
end
