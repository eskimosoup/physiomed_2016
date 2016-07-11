require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :telephone }
    it { should validate_presence_of :cv }
  end
end
