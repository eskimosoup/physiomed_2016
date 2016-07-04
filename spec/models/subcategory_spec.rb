require 'rails_helper'
#  rspec --tag 'subcategory'
RSpec.describe Subcategory, type: :model, subcategory: true do
  describe 'validations', :validation do
    subject(:subcategory) { build(:subcategory) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
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

  describe 'friendly id', :friendly_id do
    let(:subcategory) { create(:subcategory) }

    it 'creates a slug if title changed' do
      subcategory.title = 'My new title'
      expect(subcategory.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      subcategory.suggested_url = 'my-new-titled-subcategory'
      expect(subcategory.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      subcategory = create(:subcategory)
      subcategory.display = false
      expect(subcategory.should_generate_new_friendly_id?).to be false
    end
  end

  context 'callbacks' do
    let(:subcategory) { create(:subcategory) }
    it { expect(subcategory).to callback(:set_slug).before(:validation) }
  end
end
