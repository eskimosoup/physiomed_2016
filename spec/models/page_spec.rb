# == Schema Information
#
# Table name: pages
#
#  id                   :integer          not null, primary key
#  title                :string           not null
#  slug                 :string
#  suggested_url        :string
#  image                :string
#  style                :string           not null
#  layout               :string           not null
#  display              :boolean          default(TRUE)
#  content              :text             not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  display_case_studies :boolean          default(FALSE)
#  display_news         :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Page, type: :model do
  describe 'validations', :validation do
    subject(:page) { build(:page) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should have_one :what_we_do_link }
    it { should have_many(:pages_testimonials).class_name('Pages::Testimonial') }
    it { should have_many(:testimonials).through(:pages_testimonials) }
    it { should have_many(:page_team_members).dependent(:destroy).class_name('Pages::TeamMember') }
    it { should have_many(:team_members).through(:page_team_members) }
  end

  describe 'scopes', :scope do
    let(:page) { create(:page) }
    let(:hidden_page) { create(:page, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(Page.displayed).not_to include hidden_page
      end

      it 'returns displayed records' do
        expect(Page.displayed).to include page
      end
    end
  end

  describe 'friendly_id', :friendly_id do
    let(:page) { create(:page) }

    it 'creates a slug if title changed' do
      page.title = 'My new title'
      expect(page.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      page.suggested_url = 'my-new-titled-page'
      expect(page.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      page = create(:page)
      page.content = 'Gobbledegook'
      expect(page.should_generate_new_friendly_id?).to be false
    end
  end
end
