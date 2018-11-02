# == Schema Information
#
# Table name: body_parts
#
#  id                       :integer          not null, primary key
#  tagline                  :string
#  position                 :integer          default(0), not null
#  display                  :boolean          default(TRUE), not null
#  slug                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  summary                  :text
#  body_part_sections_count :integer          default(0), not null
#  category_id              :integer
#

class BodyPart < ActiveRecord::Base
  BODY_PARTS = [
    'Ankle', 'Elbow', 'Foot', 'Hip', 'Knee',
    'Lower Back', 'Lower Leg', 'Neck and Upper Back', 'Shoulder', 'Wrist'
  ].freeze

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  has_one :people_helped_section, through: :category
  has_many :articles, through: :category
  has_many :case_studies, through: :category
  has_many :frequently_asked_questions, through: :category
  has_many :guides, through: :category
  has_many :testimonials, through: :category
  has_many :videos, through: :category
  has_many :body_part_sections

  validates :category, presence: true
  validates :category_id, uniqueness: true

  scope :displayed, -> { where(display: true) }

  delegate :name, to: :category, allow_nil: true

  def image
    "body_parts/#{name.downcase.tr(' ', '_')}.jpg" if name
  end
end
