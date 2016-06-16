class Category < ActiveRecord::Base
  NAMES = [
    *BodyPart::BODY_PARTS, "General", "General Wellbeing", "Wellbeing Zone Overview"
  ].freeze
end
