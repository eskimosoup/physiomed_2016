# == Schema Information
#
# Table name: what_we_do_links
#
#  id            :integer          not null, primary key
#  what_we_do_id :integer
#  title         :string           not null
#  display       :boolean          default(TRUE), not null
#  position      :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  page_id       :integer
#

class WhatWeDoLink < ActiveRecord::Base
  belongs_to :what_we_do, counter_cache: :links_count
  belongs_to :page

  scope :displayed, -> { where(display: true) }

  validates :title, presence: true
  validates :page, presence: true
  validates :page_id, uniqueness: true
  validates :what_we_do, presence: true
end
