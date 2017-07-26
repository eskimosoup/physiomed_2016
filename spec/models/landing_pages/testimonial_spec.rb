require 'rails_helper'

RSpec.describe LandingPages::Testimonial, type: :model do
  describe 'validations' do
    it { should belong_to :landing_page }
    it { should belong_to :testimonial }
  end
end
