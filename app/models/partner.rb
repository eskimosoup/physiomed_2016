# == Schema Information
#
# Table name: partners
#
#  id          :integer          not null, primary key
#  position    :integer
#  title       :string
#  summary     :text
#  content     :text
#  image       :string
#  website_url :string
#  display     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Partner < ActiveRecord::Base
  include OptimadminScopes

  mount_uploader :image, PartnerUploader

  validates :title, presence: true
  validates :website_url, presence: true

  scope :displayed, -> { where(display: true) }
end
