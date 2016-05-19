require 'rails_helper'

RSpec.describe BodyPart, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it do
      body_part = build(:body_part)
      expect(body_part).to validate_uniqueness_of(:name)
    end
    it { should validate_inclusion_of(:name).in_array(BodyPart::BODY_PARTS) }
  end

  it "#image" do
    body_part = build(:body_part, name: "Lower Leg")

    expect(body_part.image).to eq("body_parts/lower_leg.jpg")
  end
end
