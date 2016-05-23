class PeopleHelpedSection < ActiveRecord::Base
  SECTIONS = [
    "Ankle", "Elbow", "Foot", "Hip", "Knee",
    "Lower Back", "Lower Leg", "Neck", "Shoulder",
    "Wellbeing Zone", "Wrist"
  ].freeze

  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :section, presence: true, inclusion: { in: SECTIONS }, uniqueness: true
  validates :title, presence: true
end
