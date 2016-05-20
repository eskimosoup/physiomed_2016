require 'rails_helper'

RSpec.describe FrequentlyAskedQuestion, type: :model do
  describe "validations" do
    it { should validate_presence_of(:answer) }
    it { should validate_presence_of(:question) }
  end
end
