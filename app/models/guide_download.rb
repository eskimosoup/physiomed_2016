# == Schema Information
#
# Table name: guide_downloads
#
#  id           :integer          not null, primary key
#  guide_id     :integer
#  name         :string
#  job_title    :string
#  email        :string
#  phone        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  utm_source   :string
#  utm_campaign :string
#  utm_medium   :string
#  utm_term     :string
#

class GuideDownload < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order(created_at: :desc) }

  belongs_to :guide

  validates :name, presence: true, unless: :utm_source?
  validates :job_title, presence: true, unless: :utm_source?
  validates :email, presence: true, unless: :utm_source?
  validates :phone, presence: true, unless: :utm_source?
end
