require 'rails_helper'

RSpec.describe LandingPages::Guide, type: :model do
  describe 'validations' do
    it { should belong_to :landing_page }
    it { should belong_to :guide }
  end
end
