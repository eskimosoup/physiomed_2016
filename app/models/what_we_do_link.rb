class WhatWeDoLink < ActiveRecord::Base
  belongs_to :what_we_do, counter_cache: :links_count
  belongs_to :page

  scope :displayed, -> { where(display: true) }

  validates :title, presence: true
  validates :page, presence: true
  validates :page_id, uniqueness: true
  validates :what_we_do, presence: true
end
