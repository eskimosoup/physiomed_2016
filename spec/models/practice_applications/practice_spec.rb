require 'rails_helper'

RSpec.describe PracticeApplications::Practice, type: :model do
  describe 'validations' do
    it { should validate_presence_of :address }
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :postcode }
    it { should validate_presence_of :telephone }
    it { should validate_acceptance_of :terms_and_conditions }
  end
end
