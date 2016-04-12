require 'rails_helper'

RSpec.describe BodyPart, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:mobile_position) }
    it { should validate_inclusion_of(:name).in_array(BodyPart::BODY_PARTS) }
  end
end
