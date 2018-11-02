# == Schema Information
#
# Table name: subcategories_guides
#
#  id             :integer          not null, primary key
#  subcategory_id :integer
#  guide_id       :integer
#  position       :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Subcategories::Guide, type: :model do
  describe 'associations', :association do
    it { should belong_to(:guide).class_name('::Guide') }
    it { should belong_to(:subcategory).class_name('::Subcategory') }
  end
end
