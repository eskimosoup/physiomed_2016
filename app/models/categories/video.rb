class Categories::Video < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :category
  belongs_to :video, class_name: '::Video'
end
