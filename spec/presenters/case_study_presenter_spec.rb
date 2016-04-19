require 'rails_helper'

RSpec.describe CaseStudyPresenter, type: :presenter, case_study: true do
  let(:case_study) { build(:case_study) }
  subject(:case_study_presenter) { CaseStudyPresenter.new(object: case_study, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
