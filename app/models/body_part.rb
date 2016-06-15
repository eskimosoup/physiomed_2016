class BodyPart < ActiveRecord::Base
  BODY_PARTS = [
    "Ankle", "Elbow", "Foot", "Hip", "Knee",
    "Lower Back", "Lower Leg", "Neck", "Shoulder", "Wrist"
  ].freeze

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :body_part_sections

  validates :name, presence: true, uniqueness: true, inclusion: { in: BODY_PARTS }

  scope :ordered_by_position, -> { order(position: :asc) }
  scope :displayed, -> { where(display: true) }

  def image
    "body_parts/#{ name.downcase.gsub(" ", "_") }.jpg"
  end
end
