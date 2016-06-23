class WhatWeDoLink < ActiveRecord::Base
  belongs_to :what_we_do, counter_cache: :links_count

  scope :displayed, -> { where(display: true) }

  validates :title, presence: true
  validates :url, presence: true
  validates :what_we_do, presence: true
end
