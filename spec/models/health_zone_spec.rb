require "rails_helper"

describe HealthZone, type: :model do
  it { should validate_presence_of(:home_image) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:hover_text) }
  it { should validate_presence_of(:link) }
  it do
    health_zone = build(:health_zone)
    expect(health_zone).to validate_uniqueness_of(:link)
  end
  it do
    health_zone = build(:health_zone)
    expect(health_zone).to validate_uniqueness_of(:title)
  end
end
