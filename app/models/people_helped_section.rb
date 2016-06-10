class PeopleHelpedSection < ActiveRecord::Base
  SECTIONS = [
    *BodyPart::BODY_PARTS, "Wellbeing Zone"
  ].freeze

  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :section, presence: true, inclusion: { in: SECTIONS }, uniqueness: true
  validates :title, presence: true

  scope :displayed, ->{ where(display: true) }
end
