class FrequentlyAskedQuestion < ActiveRecord::Base
  has_many :categories_frequently_asked_questions, class_name: "Categories::FrequentlyAskedQuestion"
  has_many :categories, through: :categories_frequently_asked_questions

  scope :displayed, ->{ where(display: true) }
  scope :for_category, ->(category) { joins(:categories_frequently_asked_questions).where(categories_frequently_asked_questions: { category_id: category }) }

  validates :answer, presence: true
  validates :question, presence: true
end
