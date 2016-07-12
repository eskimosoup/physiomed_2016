require 'rails_helper'

RSpec.describe TeamMemberCategory, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :category_type }
    it { should validate_inclusion_of(:category_type).in_array(TeamMemberCategory::TYPES) }
    it do
      team_member_category = create(:team_member_category)
      expect(team_member_category).to validate_uniqueness_of :category_type 
    end
  end
end
