require 'rails_helper'

RSpec.describe LandingPages::CaseStudy, type: :model do
  describe 'validations' do
    it { should belong_to :landing_page }
    it { should belong_to :case_study }
  end
end
