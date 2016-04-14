require "rails_helper"

describe Video, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:youtube_identifier) }
  end
end
