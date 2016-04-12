class BodyPart < ActiveRecord::Base
  BODY_PARTS = ["Lower Back", "Hip", "Knee", "Shoulder", "Wrist",
                "Ankle", "Foot", "Lower Leg", "Elbow", "Neck"].freeze

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true, inclusion: { in: BodyPart::BODY_PARTS }
  validates :mobile_position, presence: true

end
