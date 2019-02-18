# == Schema Information
#
# Table name: guides
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  content          :text
#  image            :string
#  file             :string           not null
#  display          :boolean          default(TRUE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  video_id         :integer
#  gated            :boolean          default(FALSE)
#  optionally_gated :boolean
#

require 'rails_helper'

RSpec.describe Guide, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :file }
  end

  describe 'associations' do
    it { should belong_to :video }
    it { should have_many(:categories_guides).class_name("Categories::Guide") }
    it { should have_many(:categories).through(:categories_guides) }
  end
end
