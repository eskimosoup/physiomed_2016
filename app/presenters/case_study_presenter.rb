class CaseStudyPresenter < BasePresenter
  presents :case_study
  delegate :id, to: :case_study
end
