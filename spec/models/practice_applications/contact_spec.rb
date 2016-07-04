require 'rails_helper'

RSpec.describe PracticeApplications::Contact, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :position }
  end
end
