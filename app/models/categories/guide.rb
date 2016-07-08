class Categories::Guide < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :category
  belongs_to :guide, class_name: '::Guide'
end
