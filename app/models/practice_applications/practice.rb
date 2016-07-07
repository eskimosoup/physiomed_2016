class PracticeApplications::Practice < ActiveRecord::Base

  mount_uploader :image_1, PracticeImageUploader
  mount_uploader :image_2, PracticeImageUploader
  mount_uploader :image_3, PracticeImageUploader

  has_many :contacts, class_name: 'PracticeApplications::Contact', validate: false
  has_many :practitioners, class_name: 'PracticeApplications::Practitioner'

  validates :address, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :postcode, presence: true
  validates :telephone, presence: true
  validates :terms_and_conditions, acceptance: true
end
