# == Schema Information
#
# Table name: categories_case_studies
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  case_study_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Categories::CaseStudy, type: :model do
  describe 'associations' do
    it { should belong_to :category }
    it { should belong_to :case_study }
  end
end
