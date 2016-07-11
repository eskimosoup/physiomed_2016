class JobApplication < ActiveRecord::Base
  belongs_to :job_listing, counter_cache: true

  mount_uploader :cv, Optimadmin::DocumentUploader

  validates :name, presence: true
  validates :email, presence: true
  validates :telephone, presence: true
  validates :cv, presence: true
end
