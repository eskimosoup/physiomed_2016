# == Schema Information
#
# Table name: categories_guides
#
#  id          :integer          not null, primary key
#  category_id :integer
#  guide_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position    :integer          default(0), not null
#

class Categories::Guide < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :category
  belongs_to :guide, class_name: '::Guide'
end
