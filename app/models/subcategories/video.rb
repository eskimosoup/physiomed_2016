# == Schema Information
#
# Table name: subcategories_videos
#
#  id             :integer          not null, primary key
#  subcategory_id :integer
#  video_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  position       :integer          default(0), not null
#

class Subcategories::Video < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :subcategory, class_name: '::Subcategory'
  belongs_to :video, class_name: '::Video'
end
