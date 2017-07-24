require 'rails_helper'

RSpec.describe LandingPages::Section, type: :model do
  describe "validations" do
    it { should validate_presence_of(:landing_page) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
  end

  describe "associations" do
    it { should belong_to(:landing_page).counter_cache }
  end
end
