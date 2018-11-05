# == Schema Information
#
# Table name: what_we_do_links
#
#  id            :integer          not null, primary key
#  what_we_do_id :integer
#  title         :string           not null
#  display       :boolean          default(TRUE), not null
#  position      :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  page_id       :integer
#

require 'rails_helper'

RSpec.describe WhatWeDoLink, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :page }
    it { should validate_presence_of :what_we_do }
    it do
      link = build(:what_we_do_link, page: create(:page))
      expect(link).to validate_uniqueness_of :page_id
    end
  end

  describe 'associations' do
    it { should belong_to(:page) }
    it { should belong_to(:what_we_do).counter_cache(:links_count) }
  end
end
