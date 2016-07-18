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
