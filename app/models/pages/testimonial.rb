# == Schema Information
#
# Table name: pages_testimonials
#
#  id             :integer          not null, primary key
#  page_id        :integer
#  testimonial_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Pages::Testimonial < ActiveRecord::Base
  belongs_to :page
  belongs_to :testimonial
end
