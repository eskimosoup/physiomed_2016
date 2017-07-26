module LandingPages
  class CaseStudy < ActiveRecord::Base
    belongs_to :case_study
    belongs_to :landing_page
  end
end
