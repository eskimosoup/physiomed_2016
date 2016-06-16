require 'rails_helper'

RSpec.describe Guide, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :file }
  end

  describe 'associations' do
    it { should have_many(:categories_guides).class_name("Categories::Guide") }
    it { should have_many(:categories).through(:categories_guides) }
  end
end
