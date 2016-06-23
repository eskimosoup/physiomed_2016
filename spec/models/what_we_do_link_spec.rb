require 'rails_helper'

RSpec.describe WhatWeDoLink, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :url }
    it { should validate_presence_of :what_we_do }
  end
  describe 'associations' do
    it { should belong_to(:what_we_do).counter_cache(:links_count) }
  end
end
