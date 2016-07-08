class Category < ActiveRecord::Base
  NAMES = [
    *BodyPart::BODY_PARTS, 'General', 'General Wellbeing', 'Wellbeing Zone Overview'
  ].freeze

  validates :name, presence: true, inclusion: { in: NAMES }, uniqueness: true

  scope :by_name, ->(name) { where(name: name) }

  mount_uploader :image, CategoryUploader

  has_one :body_part
  has_one :people_helped_section, -> { merge(PeopleHelpedSection.displayed) }
  has_many :categories_articles, class_name: 'Categories::Article'
  has_many :articles, through: :categories_articles
  has_many :categories_case_studies, class_name: 'Categories::CaseStudy'
  has_many :case_studies, through: :categories_case_studies
  has_many :categories_frequently_asked_questions, class_name: 'Categories::FrequentlyAskedQuestion'
  has_many :frequently_asked_questions, through: :categories_frequently_asked_questions
  has_many :categories_guides, class_name: 'Categories::Guide'
  has_many :guides, through: :categories_guides
  has_many :categories_testimonials, class_name: 'Categories::Testimonial'
  has_many :testimonials, through: :categories_testimonials
  has_many :categories_videos, class_name: 'Categories::Video'
  has_many :videos, through: :categories_videos
end
