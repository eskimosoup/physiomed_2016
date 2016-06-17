class Testimonial < ActiveRecord::Base
  belongs_to :case_study

  validates :content, presence: true
  validates :author, presence: true
  validates :title, presence: true

  scope :order_by, ->(order_param) { order(order_param || { title: :asc }) }
  scope :search, ->(keywords) { where("title ILIKE ?", "%#{ keywords }%") if keywords.present? }
  scope :displayed, ->{ where(display: true) }
  scope :random_order, ->{ order_by("random()") }

  has_many :categories_testimonials, class_name: "Categories::Testimonial"
  has_many :categories, through: :categories_testimonials
end
