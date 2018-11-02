# == Schema Information
#
# Table name: health_zones
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image      :string
#  home_image :string           not null
#  hover_text :string           not null
#  link       :string           not null
#  position   :integer          default(0), not null
#  display    :boolean          default(TRUE), not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe HealthZone, type: :model do
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
