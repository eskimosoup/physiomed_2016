# == Schema Information
#
# Table name: categories_videos
#
#  id          :integer          not null, primary key
#  category_id :integer
#  video_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position    :integer          default(0), not null
#

require 'rails_helper'

RSpec.describe Categories::Video, type: :model do
  describe 'associations' do
    it { should belong_to :category }
    it { should belong_to :video }
  end
end
