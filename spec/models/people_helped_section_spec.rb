require 'rails_helper'

RSpec.describe PeopleHelpedSection, type: :model do
  describe "validations" do
    it { should validate_presence_of(:number) }
    it { should validate_numericality_of(:number).only_integer.is_greater_than(0) }
    it { should validate_presence_of(:section) }
    it do
      section = build(:people_helped_section)
      
      expect(section).to validate_uniqueness_of(:section)
    end
    it { should validate_inclusion_of(:section).in_array(PeopleHelpedSection::SECTIONS) }
    it { should validate_presence_of(:title) }
  end
end
