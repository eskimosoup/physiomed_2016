require 'rails_helper'

RSpec.describe Categories::CaseStudy, type: :model do
  describe 'associations' do
    it { should belong_to :category }
    it { should belong_to :case_study }
  end
end
