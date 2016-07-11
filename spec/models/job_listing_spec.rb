require 'rails_helper'

RSpec.describe JobListing, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :display_from }
    it { should validate_presence_of :display_until }
  end
end
