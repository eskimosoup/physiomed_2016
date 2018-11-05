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

class Categories::CaseStudy < ActiveRecord::Base
  belongs_to :category
  belongs_to :case_study
end
