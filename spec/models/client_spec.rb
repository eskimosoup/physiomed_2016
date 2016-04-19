require "rails_helper"

describe Client, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it do
      client = build(:client)
      expect(client).to validate_uniqueness_of(:name)
    end
    it { should validate_presence_of(:logo) }
  end
end
