# == Schema Information
#
# Table name: practice_applications_contacts
#
#  id          :integer          not null, primary key
#  practice_id :integer
#  name        :string           not null
#  position    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PracticeApplications::Contact < ActiveRecord::Base
  belongs_to :practice, class_name: 'PracticeApplications::Practice'
  validates :name, presence: true
  validates :position, presence: true
end
