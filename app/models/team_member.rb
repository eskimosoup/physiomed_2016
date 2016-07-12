class TeamMember < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  mount_uploader :image, TeamMemberUploader

  has_many :articles, foreign_key: :author_id
  has_and_belongs_to_many :team_member_categories

  has_many :page_team_members,
           dependent: :destroy,
           class_name: 'Pages::TeamMember'

  has_many :pages,
           through: :page_team_members

  validates :forename, presence: true
  validates :surname, presence: true
  validates :role, presence: true

  scope :displayed, -> { where(display: true) }

  def name
    [forename, surname].join(' ')
  end
end
