class JobListing < ActiveRecord::Base

  has_many :job_applications

  scope :displayed, -> { where(display: true).where("display_from <= :date AND display_until >= :date", date: Date.today) }

  validates :display_from, presence: true
  validates :display_until, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
