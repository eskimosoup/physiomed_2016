require 'rails_helper'

RSpec.describe Categories::FrequentlyAskedQuestion, type: :model do
  describe 'associations' do
    it { should belong_to :category }
    it { should belong_to :frequently_asked_question }
  end
end
