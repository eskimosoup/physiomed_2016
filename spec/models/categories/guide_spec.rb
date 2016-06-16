require 'rails_helper'

RSpec.describe Categories::Guide, type: :model do
  describe 'associations' do
    it { should belong_to :category }
    it { should belong_to :guide }
  end
end
