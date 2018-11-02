# == Schema Information
#
# Table name: team_member_categories
#
#  id            :integer          not null, primary key
#  title         :string           not null
#  position      :integer          default(0), not null
#  category_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TeamMemberCategory < ActiveRecord::Base
  TYPES = %w(Clinical Management Administration).freeze

  has_and_belongs_to_many :team_members
  has_and_belongs_to_many :displayed_team_members,
                          -> { merge(TeamMember.displayed) }, class_name: 'TeamMember'

  scope :clinical, -> { where(category_type: 'Clinical') }

  validates :title, presence: true
  validates :category_type, presence: true, uniqueness: true,
                            inclusion: { in: TYPES }
end
