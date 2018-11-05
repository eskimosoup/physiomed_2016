# == Schema Information
#
# Table name: categories_videos
#
#  id          :integer          not null, primary key
#  category_id :integer
#  video_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position    :integer          default(0), not null
#

class Categories::Video < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :category
  belongs_to :video, class_name: '::Video'
end
