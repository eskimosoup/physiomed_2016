# == Schema Information
#
# Table name: landing_pages_case_studies
#
#  id              :integer          not null, primary key
#  case_study_id   :integer
#  landing_page_id :integer
#  display         :boolean          default(TRUE), not null
#  position        :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

module LandingPages
  class CaseStudy < ActiveRecord::Base
    belongs_to :case_study
    belongs_to :landing_page
  end
end
