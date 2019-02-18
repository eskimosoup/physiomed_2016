# == Schema Information
#
# Table name: subcategories_guides
#
#  id             :integer          not null, primary key
#  subcategory_id :integer
#  guide_id       :integer
#  position       :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Subcategories::Guide < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :subcategory, class_name: '::Subcategory'
  belongs_to :guide, class_name: '::Guide'
end
