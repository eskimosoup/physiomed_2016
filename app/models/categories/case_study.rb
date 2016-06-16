class Categories::CaseStudy < ActiveRecord::Base
  belongs_to :category
  belongs_to :case_study
end
