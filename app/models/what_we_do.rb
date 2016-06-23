class WhatWeDo < ActiveRecord::Base
  has_many :links, class_name: 'WhatWeDoLink'
  has_many :displayed_links, -> { merge(WhatWeDoLink.displayed) },
    class_name: 'WhatWeDoLink'

  scope :displayed, -> { where(display: true) }

  validates :title, presence: true
end
