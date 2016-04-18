class Practice < ActiveRecord::Base
  geocoded_by :post_code
  after_validation :geocode, if: :post_code_changed?

  validates :name, presence: true
  validates :post_code, presence: true, format: { 
    with: /[A-Za-z]{1,2}\d{1,2}[A-Za-z]? \d[A-Za-z]{2}/,
    message: "Please use a valid post code format" }

  scope :order_by, ->(order_param){ order(order_param || "name asc") }
  scope :search, ->(keywords){ where("name ILIKE ?", "%#{ keywords }%") if keywords.present? }
end
