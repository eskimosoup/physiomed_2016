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

require 'rails_helper'

RSpec.describe Categories::Testimonial, type: :model do
  describe 'association' do
    it { should belong_to :category }
    it { should belong_to :testimonial }
  end
end
