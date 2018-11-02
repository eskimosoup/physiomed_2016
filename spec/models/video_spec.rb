# == Schema Information
#
# Table name: videos
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  youtube_identifier :string           not null
#  display            :boolean          default(TRUE), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  subtitle           :string
#  content            :text
#

require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:youtube_identifier) }
  end

  describe 'associations' do
    it { should have_one(:guide) }
    it { should have_many(:categories_videos).class_name('Categories::Video') }
    it { should have_many(:categories).through(:categories_videos) }
    it { should have_many(:subcategories_videos).class_name('Subcategories::Video') }
    it { should have_many(:subcategories).through(:subcategories_videos) }
  end
end
