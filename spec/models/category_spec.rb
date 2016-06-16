require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it do
      category = create(:category)

      expect(category).to validate_uniqueness_of :name
    end
    it { should validate_presence_of :name }
    it { should validate_inclusion_of(:name).in_array(Category::NAMES) }
  end
end
