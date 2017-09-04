class GuideDownload < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order(created_at: :desc) }

  belongs_to :guide

  validates :name, presence: true, unless: :utm_source?
  validates :job_title, presence: true, unless: :utm_source?
  validates :email, presence: true, unless: :utm_source?
  validates :phone, presence: true, unless: :utm_source?
end
