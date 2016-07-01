require 'rails_helper'
#  rspec --tag 'subcategory'
RSpec.describe Subcategory, type: :model, subcategory: true do
  describe 'validations', :validation do
    subject(:subcategory) { build(:subcategory) }
    it { should validate_presence_of(:title) }
  end

  describe 'associations', :association do
    it { should have_many(:subcategory_videos).dependent(:destroy).class_name('Subcategories::Video') }
    it { should have_many(:videos).through(:subcategory_videos) }
  end

  describe 'scopes', :scope do
    let(:subcategory) { create(:subcategory) }
    let(:hidden_subcategory) { create(:subcategory, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(Subcategory.displayed).not_to include hidden_subcategory
      end

      it 'returns displayed records' do
        expect(Subcategory.displayed).to include subcategory
      end
    end
  end
end
