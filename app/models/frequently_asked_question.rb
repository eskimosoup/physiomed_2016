class FrequentlyAskedQuestion < ActiveRecord::Base
  has_many :categories_frequently_asked_questions, class_name: "Categories::FrequentlyAskedQuestion"
  has_many :categories, through: :categories_frequently_asked_questions

  validates :answer, presence: true
  validates :question, presence: true

  scope :displayed, ->{ where(display: true) }
end
