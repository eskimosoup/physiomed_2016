class PracticeApplications::Practitioner < ActiveRecord::Base
  belongs_to :practice, class_name: 'PracticeApplications::Practice'
end
