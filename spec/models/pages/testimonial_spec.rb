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

require 'rails_helper'

RSpec.describe Pages::Testimonial, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
