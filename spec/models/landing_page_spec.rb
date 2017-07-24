require 'rails_helper'

RSpec.describe LandingPage, type: :model do
  describe 'validations', :validation do
    subject(:landing_page) { build(:landing_page) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_inclusion_of(:style).in_array(LandingPage::STYLE) }
    it { should validate_inclusion_of(:layout).in_array(LandingPage::LAYOUT) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    #it { should belong_to(:content_blocks) }
    #it { should belong_to(:content_blocks).with_foreign_key('content_block_id') }
    #it { should belong_to(:content_blocks).counter_cache }
    #it { should have_many(:content_blocks).dependent(:destroy).class_name('Services::Article')  }
  end

  describe 'scopes', :scope do
    let(:landing_page) { create(:landing_page) }
    let(:hidden_landing_page) { create(:landing_page, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(LandingPage.displayed).not_to include hidden_landing_page
      end

      it 'returns displayed records' do
        expect(LandingPage.displayed).to include landing_page
      end
    end
  end

  describe 'friendly id', :friendly_id do
    let(:landing_page) { create(:landing_page) }

    it 'creates a slug if title changed' do
      landing_page.title = 'My new title'
      expect(landing_page.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      landing_page.suggested_url = 'my-new-titled-landing_page'
      expect(landing_page.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      landing_page = create(:landing_page)
      landing_page.content = 'new content'
      expect(landing_page.should_generate_new_friendly_id?).to be false
    end
  end

  # https://github.com/beatrichartz/shoulda-callback-matchers
  context 'callbacks' do
    let(:landing_page) { create(:landing_page) }
    it { expect(landing_page).to callback(:set_slug).before(:validation) }
  end
end
