require 'rails_helper'

RSpec.describe LandingPages::Video, type: :model do
  describe 'validations' do
    it { should belong_to :landing_page }
    it { should belong_to :video }
  end
end
