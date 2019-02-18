# == Schema Information
#
# Table name: practice_applications_practitioners
#
#  id                 :integer          not null, primary key
#  practice_id        :integer
#  name               :string
#  qualification_date :date
#  years_practicing   :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class PracticeApplications::Practitioner < ActiveRecord::Base
  belongs_to :practice, class_name: 'PracticeApplications::Practice'
end
