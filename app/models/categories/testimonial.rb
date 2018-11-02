# == Schema Information
#
# Table name: categories_testimonials
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  testimonial_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  position       :integer          default(0), not null
#

class Categories::Testimonial < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :category
  belongs_to :testimonial, class_name: '::Testimonial'
end
