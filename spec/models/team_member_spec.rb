require "rails_helper"

describe TeamMember, type: :model do
  describe "validations" do
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:role) }
  end

  describe "associations" do
    skip { should have_many(:articles) }
  end
end
