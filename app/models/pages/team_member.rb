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

class Pages::TeamMember < ActiveRecord::Base
  belongs_to :page
  belongs_to :team_member
end
