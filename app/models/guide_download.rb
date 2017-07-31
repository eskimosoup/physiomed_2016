class GuideDownload < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order(created_at: :desc) }

  belongs_to :guide

  validates :name, presence: true
  validates :job_title, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
