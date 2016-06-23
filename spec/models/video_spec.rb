require "rails_helper"

RSpec.describe Video, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:youtube_identifier) }
  end

  describe 'associations' do
    it { should have_many(:categories_videos).class_name("Categories::Video") }
    it { should have_many(:categories).through(:categories_videos) }
  end
end
