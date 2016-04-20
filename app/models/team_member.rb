class TeamMember < ActiveRecord::Base
  mount_uploader :image, TeamMemberUploader

  validates :forename, presence: true
  validates :surname, presence: true
  validates :role, presence: true
end
