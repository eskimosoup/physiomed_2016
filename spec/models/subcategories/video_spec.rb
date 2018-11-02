# == Schema Information
#
# Table name: subcategories_videos
#
#  id             :integer          not null, primary key
#  subcategory_id :integer
#  video_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  position       :integer          default(0), not null
#

require 'rails_helper'

RSpec.describe Subcategories::Video, type: :model, subcategory: true do
  describe 'associations', :association do
    it { should belong_to(:video).class_name('::Video') }
    it { should belong_to(:subcategory).class_name('::Subcategory') }
  end
end
