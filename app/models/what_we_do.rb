# == Schema Information
#
# Table name: what_we_dos
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  content      :text
#  display      :boolean          default(TRUE), not null
#  position     :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  links_count  :integer          default(0), not null
#  pdf_download :string
#  image        :string
#

class WhatWeDo < ActiveRecord::Base
  has_many :links, class_name: 'WhatWeDoLink'
  has_many :displayed_links, -> { merge(WhatWeDoLink.displayed) },
           class_name: 'WhatWeDoLink'

  mount_uploader :image, WhatWeDoUploader
  mount_uploader :pdf_download, Optimadmin::DocumentUploader

  scope :displayed, -> { where(display: true).order(:position) }

  validates :title, presence: true
end
