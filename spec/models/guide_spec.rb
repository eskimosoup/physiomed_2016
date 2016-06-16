require 'rails_helper'

RSpec.describe Guide, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :file }
  end
end
