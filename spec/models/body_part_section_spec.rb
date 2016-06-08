require 'rails_helper'

RSpec.describe BodyPartSection, type: :model do
  describe "validations" do
    it { should validate_presence_of(:body_part) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
  end

  describe "associations" do
    it { should belong_to(:body_part).counter_cache }
  end
end
