class Category < ActiveRecord::Base
  NAMES = [
    *BodyPart::BODY_PARTS, "General", "General Wellbeing", "Wellbeing Zone Overview"
  ].freeze

  validates :name, presence: true, inclusion: { in: NAMES }, uniqueness: true
end
