class Pages::TeamMember < ActiveRecord::Base
  belongs_to :page
  belongs_to :team_member
end
