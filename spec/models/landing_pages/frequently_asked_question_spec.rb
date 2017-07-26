require 'rails_helper'

RSpec.describe LandingPages::FrequentlyAskedQuestion, type: :model do
  describe 'validations' do
    it { should belong_to :landing_page }
    it { should belong_to :frequently_asked_question }
  end
end
