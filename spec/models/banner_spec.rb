require "rails_helper"

describe Banner, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }

    it "validates image width" do
      image = File.open(File.join(Rails.root, "spec/support/images/tiny_banner.jpg"))

      banner = build(:banner, image: image)
      banner.valid?

      expect(banner.errors[:image]).to include("is less than 1200 pixels wide")
    end
  end
end
