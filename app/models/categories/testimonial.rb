class Categories::Testimonial < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :category
  belongs_to :testimonial, class_name: '::Testimonial'
end
