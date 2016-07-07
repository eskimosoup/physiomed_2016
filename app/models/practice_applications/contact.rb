class PracticeApplications::Contact < ActiveRecord::Base
  belongs_to :practice, class_name: 'PracticeApplications::Practice'
  validates :name, presence: true
  validates :position, presence: true
end
