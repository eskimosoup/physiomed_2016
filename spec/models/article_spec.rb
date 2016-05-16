require "rails_helper"

describe Article do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:date) }
    it do
      article = build(:article)
      expect(article).to validate_uniqueness_of(:title) 
    end
  end

  describe "associations" do
    it { should belong_to(:author).class_name("TeamMember") }
  end
end
