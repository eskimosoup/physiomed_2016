# == Schema Information
#
# Table name: team_members
#
#  id         :integer          not null, primary key
#  forename   :string           not null
#  surname    :string           not null
#  image      :string
#  bio        :text
#  email      :string
#  phone      :string
#  role       :string           not null
#  display    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  position   :integer          default(0), not null
#

class TeamMember < ActiveRecord::Base
  default_scope { positioned }

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
  scope :positioned, -> { order(:position) }

  def name
    [forename, surname].join(' ')
  end
end
