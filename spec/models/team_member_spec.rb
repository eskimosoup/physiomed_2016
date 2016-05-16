require "rails_helper"

describe TeamMember, type: :model do
  describe "validations" do
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:role) }
  end

  describe "associations" do
    it { should have_many(:articles).with_foreign_key(:author_id) }
  end

  it "#name" do
    team_member = build(:team_member, forename: "Joe", surname: "Bloggs")
    expect(team_member.name).to eq("Joe Bloggs")
  end
end
