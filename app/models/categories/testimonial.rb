class Categories::Testimonial < ActiveRecord::Base
  belongs_to :category
  belongs_to :testimonial
end
