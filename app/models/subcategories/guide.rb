class Subcategories::Guide < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :subcategory, class_name: '::Subcategory'
  belongs_to :guide, class_name: '::Guide'
end
