class WhatWeDo < ActiveRecord::Base
  has_many :links, class_name: 'WhatWeDoLink'

  scope :displayed, -> { where(display: true) }

  validates :title, presence: true
end
