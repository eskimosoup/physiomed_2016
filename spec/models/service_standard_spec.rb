require "rails_helper"

describe ServiceStandard, type: :model do
  describe "validations" do
    it { should validate_presence_of(:icon) }
    it { should validate_inclusion_of(:icon).in_array(ServiceStandard::ICONS) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:hover_content) }
  end
end
