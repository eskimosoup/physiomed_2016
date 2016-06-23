require "rails_helper"

RSpec.describe ServiceStandard, type: :model do
  describe "validations" do
    it { should validate_presence_of(:icon) }
    it { should validate_inclusion_of(:icon).in_array(ServiceStandard::ICONS) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:hover_content) }
  end

  it "#icon_image" do
    standard = ServiceStandard.new(icon: "clock")

    expect(standard.icon_image).to eq("icons/clock.png")
  end
end
