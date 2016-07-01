class Pages::Testimonial < ActiveRecord::Base
  belongs_to :page
  belongs_to :testimonial
end
