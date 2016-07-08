class WhatWeDo < ActiveRecord::Base
  has_many :links, class_name: 'WhatWeDoLink'
  has_many :displayed_links, -> { merge(WhatWeDoLink.displayed) },
           class_name: 'WhatWeDoLink'

  mount_uploader :image, WhatWeDoUploader
  mount_uploader :pdf_download, Optimadmin::DocumentUploader

  scope :displayed, -> { where(display: true).order(:position) }

  validates :title, presence: true
end
