# == Schema Information
#
# Table name: job_applications
#
#  id             :integer          not null, primary key
#  job_listing_id :integer
#  name           :string           not null
#  telephone      :string
#  email          :string           not null
#  cv             :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class JobApplication < ActiveRecord::Base
  belongs_to :job_listing, counter_cache: true

  mount_uploader :cv, Optimadmin::DocumentUploader

  validates :name, presence: true
  validates :email, presence: true
  validates :telephone, presence: true
  validates :cv, presence: true
end
