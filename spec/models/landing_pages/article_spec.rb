require 'rails_helper'

RSpec.describe LandingPages::Article, type: :model do
  describe 'validations' do
    it { should belong_to :landing_page }
    it { should belong_to :article }
  end
end
