class Testimonial < ActiveRecord::Base
  belongs_to :case_study

  validates :content, presence: true
  validates :author, presence: true
  validates :title, presence: true

  scope :search, ->(keywords) { where("title ILIKE ?", "%#{ keywords }%") if keywords.present? }
  scope :displayed, ->{ where(display: true) }
  scope :for_category, ->(category) { joins(:categories_testimonials).where(categories_testimonials: { category_id: category }) }

  has_many :categories_testimonials, class_name: "Categories::Testimonial"
  has_many :categories, through: :categories_testimonials
end
