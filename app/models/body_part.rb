class BodyPart < ActiveRecord::Base
  BODY_PARTS = [
    'Ankle', 'Elbow', 'Foot', 'Hip', 'Knee',
    'Lower Back', 'Lower Leg', 'Neck', 'Shoulder', 'Wrist'
  ].freeze

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  has_many :body_part_sections

  validates :category, presence: true
  validates :category_id, uniqueness: true

  scope :displayed, -> { where(display: true) }

  delegate :name, to: :category, allow_nil: true

  def image
    "body_parts/#{name.downcase.tr(' ', '_')}.jpg"
  end
end
