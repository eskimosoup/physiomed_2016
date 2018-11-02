# == Schema Information
#
# Table name: job_listings
#
#  id                     :integer          not null, primary key
#  title                  :string           not null
#  summary                :text
#  description            :text             not null
#  display_from           :date             not null
#  display_until          :date             not null
#  display                :boolean          default(TRUE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  job_applications_count :integer          default(0)
#

class JobListing < ActiveRecord::Base
  has_many :job_applications, dependent: :destroy

  scope :displayed, -> { where(display: true).where('display_from <= :date AND display_until >= :date', date: Date.today) }

  validates :display_from, presence: true
  validates :display_until, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
