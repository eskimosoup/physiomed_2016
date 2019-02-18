# == Schema Information
#
# Table name: body_part_sections
#
#  id           :integer          not null, primary key
#  body_part_id :integer
#  title        :string           not null
#  sub_title    :string
#  content      :text             not null
#  image        :string
#  position     :integer          default(0), not null
#  display      :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class BodyPartSection < ActiveRecord::Base
  mount_uploader :image, BodyPartSectionUploader

  belongs_to :body_part, counter_cache: true

  scope :displayed, -> { where(display: true) }

  validates :body_part, presence: true
  validates :content, presence: true
  validates :title, presence: true
  
end
