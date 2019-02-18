# == Schema Information
#
# Table name: categories_guides
#
#  id          :integer          not null, primary key
#  category_id :integer
#  guide_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position    :integer          default(0), not null
#

require 'rails_helper'

RSpec.describe Categories::Guide, type: :model do
  describe 'associations' do
    it { should belong_to :category }
    it { should belong_to :guide }
  end
end
