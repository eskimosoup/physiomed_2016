# == Schema Information
#
# Table name: people_helped_sections
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  number      :integer          not null
#  content     :text
#  link        :string
#  display     :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class PeopleHelpedSection < ActiveRecord::Base
  SECTIONS = [
    *BodyPart::BODY_PARTS, "Wellbeing Zone"
  ].freeze

  belongs_to :category

  scope :displayed, ->{ where(display: true) }

  delegate :name, to: :category, prefix: true

  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :category, presence: true
  validates :category_id, uniqueness: true
  validates :title, presence: true


end
