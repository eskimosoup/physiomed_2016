class TeamMember < ActiveRecord::Base
  mount_uploader :image, TeamMemberUploader

  has_many :articles, foreign_key: :author_id

  validates :forename, presence: true
  validates :surname, presence: true
  validates :role, presence: true

  scope :displayed, ->{ where(display: true) }

  def name
    [forename, surname].join(" ")
  end
end
