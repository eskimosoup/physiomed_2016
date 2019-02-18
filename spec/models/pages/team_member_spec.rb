# == Schema Information
#
# Table name: pages_team_members
#
#  id             :integer          not null, primary key
#  page_id        :integer
#  team_member_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Pages::TeamMember, type: :model do
  describe 'associations', :association do
    it { should belong_to(:page) }
    it { should belong_to(:team_member) }
  end
end
