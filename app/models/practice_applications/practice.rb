# == Schema Information
#
# Table name: practice_applications_practices
#
#  id                             :integer          not null, primary key
#  name                           :string           not null
#  address                        :text             not null
#  county                         :string
#  postcode                       :string           not null
#  telephone                      :string           not null
#  fax                            :string
#  email                          :string           not null
#  public_liability_insurance     :boolean          default(TRUE), not null
#  employee_liability_insurance   :boolean          default(TRUE), not null
#  monday                         :string
#  tuesday                        :string
#  wednesday                      :string
#  thursday                       :string
#  friday                         :string
#  capacity                       :string
#  receptionist                   :boolean          not null
#  parking_facilities             :boolean          not null
#  established                    :string
#  cancellation_policy            :text
#  description                    :text
#  treatment_rooms                :string
#  initial_assessment_cost        :string
#  subsequent_treatment_cost      :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  initial_assessment_duration    :string
#  subsequent_treatment_duration  :string
#  manual_therapy                 :string
#  tm2_or_pps                     :string
#  online_booking                 :boolean
#  saturday                       :string
#  sunday                         :string
#  disabled_access                :boolean
#  bupa_registered                :boolean
#  domiciliary_visits             :boolean
#  public_liability_expiry_date   :date
#  employee_liability_expiry_date :date
#  document                       :string
#

class PracticeApplications::Practice < ActiveRecord::Base

  mount_uploader :image_1, PracticeImageUploader
  mount_uploader :image_2, PracticeImageUploader
  mount_uploader :image_3, PracticeImageUploader
  mount_uploader :document, PracticeApplicationUploader

  has_many :contacts, class_name: 'PracticeApplications::Contact', validate: false
  has_many :practitioners, class_name: 'PracticeApplications::Practitioner'

  validates :address, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :postcode, presence: true
  validates :telephone, presence: true
  validates :terms_and_conditions, acceptance: true
end
